(define (cont-frac n d k)
	(if (= k 0)
		(/ (n k) (d k))
		(/ (n k)  
		   (+ (d k)
		   	  (cont-frac n d (- k 1))))))


(define (iter-cont-frac n d k)

	(define (iter a b c)
		(if (= c 0)
        	(/ a b)
        	(iter (n (- c 1)) (+ (d (- c 1)) (/ a b)) (- c 1)))
			)

	(iter (n k) (d k) k))



; 1.61803
(cont-frac (lambda (i) 1.0) 
	(lambda (i) 1.0)
    5)

; в чем инвариант??

(iter-cont-frac (lambda (i) 1.0) 
	(lambda (i) 1.0)
    5)


