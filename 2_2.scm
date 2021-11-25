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

(define (print-point p) 
	(newline)
	(display "(") 
	(display (x-point p))
	(display ",")
	(display (y-point p)) 
	(display ")"))

(define start (make-point 1 2))
(define end (make-point 3 4))

(print-point start)
(print-point end)

(define segment (make-segment start end))

(define (average x y)
	(/ (+ x y) 2))

(define (midpoint-segment segment)
	(let ((start (start-segment segment))
		  (end (end-segment segment)))
	(make-point (average (x-point start) (x-point end))
	            (average (y-point start) (y-point end)))))



(print-point (midpoint-segment segment))