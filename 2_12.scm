(define (make-interval a b)
	(cons a b))

(define (lower-bound x)
	(car x))

(define (upper-bound x)
	(cdr x))

(define (make-center-width c w) 
	(make-interval (- c w) (+ c w)))

(define (center i)
	(/ (+ (lower-bound i) 
		  (upper-bound i))
		2.0))

(define (width i)
	(/ (- (upper-bound i)
	      (lower-bound i))
	    2.0))


(define (make-center-percent x y)
	(make-interval (- x (* x (/ y 100.0))) 
		           (+ x (* x (/ y 100.0)))))

(define (percent x)
	(* (/ (width x) (center x))
	   100))

(define a (make-center-percent 6.8 10))
(percent a)



(width a)