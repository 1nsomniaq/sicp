(define (integral f a b dx)
	(define (add-dx x)
		(+ x dx))
	(* (sum f (+ a (/ dx 2)) add-dx b) dx))

(define (cube x)
	(* x x x))

(define (simpson-integral f a b n)

	(define (h)
		(/ (- b a) n))

	(define (f-with-mult x)
		(define (get-mult)
			(cond ((or (= x b) (= x a)) 1)
				  ((= (remainder (* x n) (* 2 (h) n)) 0) 2)
				  (else 4)))
		(* (get-mult) (f x)))

	(define (add-h x)
		(+ x (h)))

   (exact->inexact (* (sum f-with-mult a add-h b)
   	                  (/ (h) 3))))

	

(define (sum term a next b) 
	(if (> a b)
		0
		(+ (term a)(sum term (next a) next b))))

(define (same x)
	x)


(integral cube 0 1 0.01)

(simpson-integral same 0 1 2)

(simpson-integral cube 0 1 100)
(simpson-integral cube 0 1 1000)
