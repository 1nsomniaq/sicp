(define (make-rat n d) 
	(let ((g (abs (gcd n d))))
    (cons (/ ((get-sign d) n) g) 
    	  (abs (/ d g)))))


(define (abs x)
	(if (< x 0)
		(- x)
		x
	))

(define (get-sign x)
	(if (< x 0)
		-
		+))

(define (gcd a b)
	(if (= b 0)
		a
		(gcd b (remainder a b)))
	)

(define (numer x) (car x)) 

(define (denom x) (cdr x))


(define (add-rat x y)
(make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
(make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
(make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
(make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))


(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


(define minus-one-half (make-rat (- 1) 2))

(print-rat minus-one-half)

(define minus-one-half (make-rat  1 (- 2)))

(print-rat minus-one-half)


(define minus-one-third (make-rat  4 (- 12)))

(print-rat minus-one-third)



(define one-half (make-rat (- 1) (- 2)))

(print-rat one-half)

(define one-half (make-rat 1 2))

(define one-third (make-rat 1 3)) 

(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))
