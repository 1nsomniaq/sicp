(define (accumulate combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (term a) (accumulate combiner null-value term (next a) next b))))



(define (iter-accumulate combiner null-value term a next b)

	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner result (term a)))))

	(iter a null-value))


(define (product term a next b)
	(accumulate * 1 term a next b))


(define (iter-product term a next b)
	(iter-accumulate * 1 term a next b))

(define (sum term a next b)
	(accumulate + 0 term a next b))
	

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


(exact->inexact (* 4 (product next-pi-el 2 add2 1000)))
(exact->inexact (* 4 (iter-product next-pi-el 2 add2 1000)))

