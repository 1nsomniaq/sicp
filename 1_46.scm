(define tolerance 0.00001)

(define (iterative-improve check improve)

	(define (try guess)
		(newline)
		(display guess)

		(let (( next (improve guess)))
			(if (check guess next)
				next
				(try next))))

	(lambda (x) (try x)))


(define (average a b)
	(/ (+ a b) 2))

(define (close-enough? x y) 
	(< (abs (- x y)) tolerance))

(define (fixed-point f first-guess)
	((iterative-improve close-enough? f) first-guess)
	)

(define (sqrt x)
	(fixed-point (lambda (y) (average y (/ x y))) 1.0))

(sqrt 10000)