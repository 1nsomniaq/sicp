(define (newton-transform g)
	 (lambda (x)(- x (/ (g x) ((deriv g) x)))))

(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define tolerance 0.00001)
(define dx 0.00001)

(define (fixed-point f first-guess)
	(define (close-enough? a b)
		(< (abs (- a b )) tolerance))

	(define (try guess)

		(let (( next (f guess)))
			(if (close-enough? guess next)
				next
				(try next))))

	(try first-guess))

(define (newtons-method g guess)
	(fixed-point (newton-transform g) guess))

(define (cubic a b c)
	(lambda (x) (+ (* x x x) (* a x x) (* b x) c)))

(newtons-method (cubic 3 2 1) 1) 