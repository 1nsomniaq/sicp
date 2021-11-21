(define tolerance 0.00001)

(define (average-damp f)
	(lambda (x) (average x (f x))))

(define (compose f g)
	(lambda (x) (f (g x))))

(define (repeated f n)
	(if (= n 1)
		(lambda (x) (f x))
		(compose f (repeated f (- n 1)))
		))

(define (average a b)
	(/ (+ a b)
		2))

(define (power x n)
	(if (= n 0)
		1
		(* x (power x (- n 1))))
	)

(define (fixed-point f first-guess)
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


; функция возведения в степень

(define (n-root x n repeat-times)
	(fixed-point ((repeated average-damp repeat-times) (lambda (y) (/ x (power y (- n 1)))))
	1.0))


; дважды примененное усреднение к кубическому корню

; ((repeated average 2) )

(power 2 2)
(n-root 81 4 2)

(n-root 81 5 2)
(n-root 81 6 2)
(n-root 81 7 2)
(n-root 10000 8 3)



(n-root 10000 8 3)

(n-root 10000 16 4)
(n-root 10000 32 5)
