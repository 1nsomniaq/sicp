(define (accumulate filter combiner null-value term a next b)
	(if (> a b)
		null-value
		(combiner (if (filter a) (term a) null-value)
		          (accumulate filter combiner null-value term (next a) next b))))

(define (iter-accumulate filter combiner null-value term a next b)

	(define (iter a result)
		(if (> a b)
			result
			(iter (next a) (combiner result (if (filter a) (term a) null-value)))))

	(iter a null-value))


(define (product filter term a next b)
	(accumulate filter * 1 term a next b))


(define (iter-product filter term a next b)
	(iter-accumulate filter * 1 term a next b))

(define (sum filter term a next b)
	(accumulate filter + 0 term a next b))


(define (identity x)
	x)

(define (no-filter x)
	x)

(define (inc x)
	(+ x 1))

(define (add2 x)
	(+ x 2))

(define (prime? n)
     (= (find-div n) n))

(define (find-div n)
     (test-div n 2))

(define (divide? a b)
	(= 0 (remainder b a)))

(define (test-div n div)
	(cond ((> (square div) n ) n)
		  ((divide? div n) div)
		  (else (test-div n (+ div 1)))))

(define (next-pi-el x)
	( if (= x 2)
	 	 (/ 2 3)
	 	 (/ (* x x)
	 	 	(* (- x 1)
	 	 	   (+ x 1)))))

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b))))

(define (relative-prime? a b)
	(= (gcd b a) 1))


(define (product-of-relative-primes n) 
   (define (filter x) 
     (relative-prime? x n)) 
 (accumulate filter * 1 identity 1 inc n )) 

(sum prime? square 1 inc 5)

(sum no-filter identity 1 inc 5)

(product-of-relative-primes 10)

; ; factorial
(product no-filter identity 1 inc 5)
(iter-product no-filter identity 1 inc 5)


(exact->inexact (* 4 (product no-filter next-pi-el 2 add2 1000)))
(exact->inexact (* 4 (iter-product no-filter next-pi-el 2 add2 1000)))




