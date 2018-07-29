(define (minsec-to-sec timestamp)
  (let* ([my-regex (regexp-match #px"([\\d]{1,2}):([\\d]{1,2})" timestamp)]
	 [min (string->number (list-ref my-regex 1))]
	 [sec (string->number (list-ref my-regex 2))])
    (+ (* min 60) sec)))

(define (sec-to-minsec sec)
  (let ([sec-pos (modulo sec 60)])
  (string-append (number->string (quotient sec 60)) ":"
		 (if (< sec-pos 10) (string-append "0" (number->string sec-pos))
		     (number->string sec-pos))
		 )))


(define (minsec-subtract t1 . t2)
  (let ([sec1 (timestamp-to-sec t1)]
	[othersecs (map timestamp-to-sec t2)])
    (sec-to-timestamp (apply - (cons sec1 othersecs)))
    ))
