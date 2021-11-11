(define (product term a next b)
	(if (> a b)
		1
		(* (term a) (product term (next a) next b))))





(define (iter-product term a next b)

	(define (iter a result)
		(if (> a b)
			result
			(iter  (next a) (* result (term a)))))

	(iter a 1))


	

(define (identity x)
	x)

(define (inc x)
	(+ x 1))

(define (add2 x)
	(+ x 2))


(define (next-pi-el x)
	( if (= x 2)
	 	 (/ 2 3)
	 	 (/ (* x x)
	 	 	(* (- x 1)
	 	 	   (+ x 1)))))
	




; factorial
(product identity 1 inc 5)
(iter-product identity 1 inc 5)



; pi
(exact->inexact (* 4 (product next-pi-el 2 add2 1000)))
(exact->inexact (* 4 (iter-product next-pi-el 2 add2 1000)))


(next-pi-el 2)
(next-pi-el 4)
(next-pi-el 6)

; инвариант в том, что result это результат на a шаге