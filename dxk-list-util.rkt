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
