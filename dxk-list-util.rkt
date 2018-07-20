;; splits a list into equal partitions (with the leftovers)
(define (chunkify lst n) (let ([lstn (length lst)])
  (when (> n lstn) (set! n lstn))
  (cond [(> lstn 0) (cons (take lst n) (chunkify (drop lst n) n))]
        [else '()])))
        
;; counts elements in a list and returns as a hash table
(define (list-count lst)
  (let ([myhash (make-hash)])
    (for/list ([i lst])
      (if (hash-has-key? myhash i)
	  (hash-update! myhash i (lambda (n) (+ 1 n)))
	  (hash-set! myhash i 1)))
    myhash))

;; pads input list with padval if below n    
(define (list-pad lst [n 0] #:padval [padval '()])
  (let ([len (length lst)]
	[padn (max n 0)])
    (if (> padn len)
      (append lst (build-list (- padn len) (lambda (n) padval)))
      lst)
    ))
      
