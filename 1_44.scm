(define dx 0.00001)


(define (smooth f)
	(lambda (x) (/ (+ (f x)
				      (f (- x dx))
				      (f (+ x dx)))
		     		3)))

(define (compose f g)
	(lambda (x) (f (g x))))

(define (repeated f n)
	(if (= n 1)
		(lambda (x) (f x))
		(compose f (repeated f (- n 1)))
		))

(define (square x)
	(* x x))


(((repeated smooth 5) square) 3)