#lang racket

(provide (all-defined-out))

(define (hash-nref myhash mykeys [nope '()])
  (if (and (hash? myhash) (> (length mykeys) 0))
    (let* ([cur-key (car mykeys)]
	   [rest-keys (cdr mykeys)]
	   [cur-val (hash-ref myhash cur-key nope)])
      (if (= (length rest-keys) 0)
	  cur-val
	  (hash-nref cur-val rest-keys nope))
      )
    nope))
