(define (equal-modulo-2 x y)
	(= (remainder x 2) (remainder y 2)))


(define (same-parity x . y)
	
	(define (same-parity-rec x y)
		(if (null? y)
		    '()
		    (if (equal-modulo-2 x (car y))
		    	(cons (car y) (same-parity-rec x (cdr y)))
		    	(same-parity-rec x (cdr y)))))

	(cons x (same-parity-rec x y)))


(same-parity 1)
(same-parity 1 3 5)


(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
