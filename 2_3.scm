(define (rect-by-two-sides a b)
	(cons a b))

(define (first-side x)
	(car x))

(define (second-side x)
	(cdr x))

(define (abs x)
	(if (< x 0)
		(- x)
		x
	))

; (define (rect-by-two-points a b)
; 	(cons a b)

(define (make-segment x y)
	(cons x y))

(define (start-segment x)
	(car x))

(define (end-segment x)
	(cdr x))

(define (make-point x y)
	(cons x y))

(define (x-point x)
	(car x))

(define (y-point x)
	(cdr x))

(define (length-segment x)
	; parallel to oxis only!
	(let ((a (start-segment x))
		  (b (end-segment x)))
	(if (= (x-point a) (x-point b))
		(abs (- (y-point a) (y-point b)))
		(abs (- (x-point a) (x-point b)))
	)))

(define (square x)
	(* (length-segment (first-side x))
	   (length-segment (second-side x))))

(define (perimeter x)
	(* 2
	   (+ (length-segment (first-side x))
	   	  (length-segment (second-side x)))))



; b(1, 5)-------c(10,5)
; |
; |
; |
; a(1, 1)

(define a (make-point 1 1 ))
(define b (make-point 1 5 ))
(define c (make-point 10 5 ))

(define abc (rect-by-two-sides (make-segment a b)
 (make-segment b c)))


(length-segment (make-segment a b))

(square abc)

(perimeter abc)