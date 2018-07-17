;; splits a list into equal partitions (with the leftovers)
(define (chunkify lst n) (let ([lstn (length lst)])
  (when (> n lstn) (set! n lstn))
  (cond [(> lstn 0) (cons (take lst n) (chunkify (drop lst n) n))]
        [else '()])))
