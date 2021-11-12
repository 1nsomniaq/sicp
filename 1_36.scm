(define tolerance 0.00001)

(define (fixed-points f first-guess)
	(define (close-enough? a b)
		(< (abs (- a b )) tolerance))

	(define (try guess)
		(newline)
		(display guess)

		(let (( next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))

	(try first-guess))

(define (average a b)
	(/ (+ a b)
		2))

(fixed-points (lambda (x) (+ 1 (/ 1.0 x))) 1)


(fixed-points (lambda (x) (/ (log 1000) (log x))) 2)

(fixed-points (lambda (x) (average x (/ (log 1000) (log x)))) 2)