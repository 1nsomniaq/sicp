(define (make-interval a b)
	(cons a b))

(define (lower-bound x)
	(car x))

(define (upper-bound x)
	(cdr x))

(define (width-interval x)
	(/ (- (upper-bound x)
	      (lower-bound x))
	    2))

(define (add-interval x y)
	(make-interval (+ (lower-bound x)
					  (lower-bound y))
				   (+ (upper-bound x)
				      (upper-bound y))))

(define (sub-interval x y)
	(make-interval (- (lower-bound x)
					  (upper-bound y))
	               (- (upper-bound x)
	                  (lower-bound y))
	               ))

(define (mul-interval x y) 
	(let ((p1 (* (lower-bound x) (lower-bound y)))
	      (p2 (* (lower-bound x) (upper-bound y)))
	      (p3 (* (upper-bound x) (lower-bound y)))
	      (p4 (* (upper-bound x) (upper-bound y))))
	
	(make-interval (min p1 p2 p3 p4)
	               (max p1 p2 p3 p4))))


(define (div-interval x y)
	 (mul-interval x (make-interval (/ 1.0 (upper-bound y)) 
     							 	(/ 1.0 (lower-bound y)))))


(define a (make-interval 6.12 7.48))

(define b (make-interval (- 2.58 0.258) (+ 2.58 0.258)))

(define c (add-interval a b))

(define d (mul-interval a b))

(sub-interval c b)

(width-interval a)

(width-interval b)

(width-interval c)

(width-interval d)

;    1---------5
;         2---------6

;           3-------------------11




