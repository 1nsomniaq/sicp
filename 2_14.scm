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

(define (add-interval x y)
	(make-interval (+ (lower-bound x)
					  (lower-bound y))
				   (+ (upper-bound x)
				      (upper-bound y))))

(define (mul-interval x y) 
	(let ((p1 (* (lower-bound x) (lower-bound y)))
	      (p2 (* (lower-bound x) (upper-bound y)))
	      (p3 (* (upper-bound x) (lower-bound y)))
	      (p4 (* (upper-bound x) (upper-bound y))))
	
	(make-interval (min p1 p2 p3 p4)
	               (max p1 p2 p3 p4))))


(define (make-center-percent x y)
	(make-interval (- x (* x (/ y 100.0))) 
		           (+ x (* x (/ y 100.0)))))

(define (percent x)
	(* (/ (width x) (center x))
	   100))

(define (div-interval x y)
	(let ((p1 (lower-bound y))
	      (p2 (upper-bound y)))
		(if (<= (* (lower-bound y) (upper-bound y)) 0)
			(error "Деление на нулевой интервал")
			 (mul-interval x (make-interval (/ 1.0 (upper-bound y)) 
		     							 	(/ 1.0 (lower-bound y)))))))

(define (par1 r1 r2)
	(div-interval (mul-interval r1 r2)
                  (add-interval r1 r2)))


(define (par2 r1 r2)
	(let ((one (make-interval 1 1)))
		 (div-interval one
                       (add-interval (div-interval one r1)
                                     (div-interval one r2)))))

(define a (make-center-percent 60.8 5))

(define b (make-center-percent 55.8 3))
(percent a)
(width a)


(par1 a b)
(par2 a b)

(div-interval a a)
(div-interval a b)