
(define (power base n)
	(cond ((= n 0 ) 1)
		  ((even? n) (square (power base (/ n 2))))
		  (else (* base (power base (- n 1))))))

(power 2 5)


(define (divide-if-no-remainder x y)
	(if (= (remainder x y) 0)
		(divide-if-no-remainder (/ x y) y)
		x))

(define (cons a b)
	(* (power 2 a)
		(power 3 b)))

(define (car x)
	(/ (log (divide-if-no-remainder x 3)) (log 2))
	)


(define (cdr x)
	(/ (log (divide-if-no-remainder x 2)) (log 3))
	)

(divide-if-no-remainder 648 3)



(power 3 6)

(define a (cons 3 4))
(car a)
(cdr a)


; 1 0
; -> 2

; 0 0 
; -> 2

; 0 1
; -> 3

; 1 1
; -> 6 / 3 = 2 / 2

; 
; 2 1
; -> 4 * 3 = 12 / 3 = 4 / 2 = 2


; 1 2
; -> 2 * 9 = 18 / 2 = 9/3 = 

; 3 4
; -> 8 * 81 = 648 / 3 = 216 / 3 = 72 / 3 = 24 / 3 = 8