(define (make-interval a b)
	(cons a b))

(define (lower-bound x)
	(car x))

(define (upper-bound x)
	(cdr x))

(define (add-interval x y)
	(make-interval (+ (lower-bound x)
					  (lower-bound y))
				   (+ (upper-bound x)
				      (upper-bound y))))

(define (sub-interval x y)
	(make-interval (- (lower-bound x)
					  (lower-bound y))
	               (- (upper-bound x)
	                  (upper-bound y))
	               ))

(define (mul-interval x y) 
	(let ((p1 (* (lower-bound x)
	      (p2 (* (lower-bound x) 
	      (p3 (* (upper-bound x)
	      (p4 (* (upper-bound x)
	(lower-bound y)))
	(upper-bound y)))
	(lower-bound y)))
	(upper-bound y))))

	(make-interval (min p1 p2 p3 p4)
	               (max p1 p2 p3 p4))))


(define (div-interval x y)
	 (mul-interval x (make-interval (/ 1.0 (upper-bound y)) 
     							 	(/ 1.0 (lower-bound y)))))


(define a (make-interval 6.12 7.48))

(define b (make-interval (- 2.58 0.258) (+ 2.58 0.258)))

(define c (add-interval a b))

(sub-interval c b)


;    1---------5
;         2---------6

;           3-------------------11




