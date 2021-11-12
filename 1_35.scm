(define tolerance 0.00001)



(define (fixed-points f first-guess)
	(define (close-enough? a b)
		(< (abs (- a b )) tolerance))

	(define (try guess)

		(let (( next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))

	(try first-guess))




(exact->inexact (fixed-points (lambda (x) (+ 1 (/ 1 x))) 1))