#lang racket

(provide (all-defined-out))

;; nested reference
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

;; nested setting
(define (hash-nset myhash mykeys val)
  (let* ([cur-key (car mykeys)]
	 [rest-keys (cdr mykeys)]
	 [rest-len (length rest-keys)]
	 [cur-val (hash-ref myhash cur-key (hash))])
    (if (= 0 rest-len) (hash-set myhash cur-key val)
	(hash-set myhash cur-key (hash-nset cur-val rest-keys val))
	)))
