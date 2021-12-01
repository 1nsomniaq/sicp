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


(define (mul-interval-old x y) 
	(let ((p1 (* (lower-bound x) (lower-bound y)))
	      (p2 (* (lower-bound x) (upper-bound y)))
	      (p3 (* (upper-bound x) (lower-bound y)))
	      (p4 (* (upper-bound x) (upper-bound y))))
	
	(make-interval (min p1 p2 p3 p4)
	               (max p1 p2 p3 p4))))

(define (is-positive x)
	(and (>=  (lower-bound x) 0)))

(define (is-negative x)
	(and (<= (upper-bound x) 0)))


(define (mul-interval x y) 
	(let ((p1 (lower-bound x))
	      (p2 (upper-bound x))
	      (p3 (lower-bound y))
	      (p4 (upper-bound y)))
	(cond ((is-positive x) (cond ((is-positive y) (make-interval (* p1 p3) (* p2 p4)))
								 ((is-negative y) (make-interval   (* p2 p3) (* p1 p4)))
								 (else (make-interval (* p2 p3) (* p4 p2)))))
	      ((is-negative x) (cond ((is-positive y) (make-interval (* p1 p4) (* p2 p3)))
								 ((is-negative y) (make-interval (* p2 p4) (* p1 p3)))
								 (else (make-interval (* p2 p3) (* p4 p2)))))
	      (else (cond ((is-positive y) (make-interval (* p1 p4) (* p2 p4)))
					  ((is-negative y) (make-interval (* p2 p3) (* p3 p1)))
					  (else (mul-interval-old x y)))

	      	))))


(define (div-interval x y)
	(let ((p1 (lower-bound y))
	      (p2 (upper-bound y)))
		(if (<= (* (lower-bound y) (upper-bound y)) 0)
			(error "Деление на нулевой интервал")
			 (mul-interval x (make-interval (/ 1.0 (upper-bound y)) 
		     							 	(/ 1.0 (lower-bound y)))))))

; пересекает 0
(define a (make-interval -6.12 7.48))

; до 0
(define c (make-interval -7.48 -6))

; после 0
(define b (make-interval 2 14))

; начинается в нуле
(define d (make-interval 0 14))

; заканчивается в 0
(define e (make-interval -2 0))

(is-positive b)
(is-positive d)
(is-positive e)


(mul-interval  b b)
(mul-interval-old b b)


(mul-interval  d d)
(mul-interval-old d d)
(mul-interval  b d)
(mul-interval-old b d)
(mul-interval  d b)
(mul-interval-old d b)
(mul-interval  b c)
(mul-interval-old b c)
(mul-interval  b e)
(mul-interval-old b e)
(mul-interval d c)
(mul-interval-old d c)
(mul-interval d e)
(mul-interval-old d e)
(mul-interval d a)
(mul-interval-old d a)
(mul-interval b a)
(mul-interval-old b a)





(mul-interval c b)
(mul-interval-old c b)


(mul-interval c d)
(mul-interval-old c d)

(mul-interval e b)
(mul-interval-old e b)

(mul-interval e d)
(mul-interval-old e d)

(mul-interval e c)
(mul-interval-old e c)

(mul-interval c e)
(mul-interval-old c e)



(mul-interval a b)
(mul-interval-old a b)


(mul-interval a d)
(mul-interval-old a d)


(mul-interval a c)
(mul-interval-old a c)


(mul-interval a e)
(mul-interval-old a e)
