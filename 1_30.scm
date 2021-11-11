
(define (sum term a next b) 

	(define (iter a result)
		(if (> a b)
			result
			(iter  (next a) (+ result (term a)))))

	(iter a 0))


(define (inc a)
	(+ 1 a))

(define (identity x)
	x)

(define (integral f a b dx)
	(define (add-dx x)
		(+ x dx))
	(* (sum f (+ a (/ dx 2)) add-dx b) dx))

(sum identity 1 inc 5)
(sum identity 1 inc 2)
(sum identity 2 inc 2)


(integral cube 0 1 0.01)

; Какой инвариант?
; result - результат на а-ом шаге

; iter (- 5 1) (+ 1 0)   iter 4 1
; iter 

; (sum identity 1 inc 2)
; iter 0 0
; iter 1 1
; iter 2 3
; 