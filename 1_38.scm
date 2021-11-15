(define (cont-frac n d k)

	(define (cont-frac-inner i)
	(if (= i k)
		(/ (n i) (d i))
		(/ (n i)  
		   (+ (d i)
		   	  (cont-frac-inner  (+ i 1))))))

	(cont-frac-inner 1))


(define (iter-cont-frac n d k)

	(define (iter a b c)
		(if (= c 1)
        	(/ (n 1) b)
        	(iter (n (- c 1)) (+ (d (- c 1)) (/ a b)) (- c 1)))
			)

	(iter (n k) (d k) k))



(cont-frac (lambda (i) 1.0) 
	(lambda (i) (if (= (remainder i 3) 2)
	 				 (* 2 
	 				    (+ 1
	 				     (/ (- i 2)
	 				     	3)))
	 				 1  
	 				 ))
    100)


(iter-cont-frac (lambda (i) 1.0) 
	(lambda (i) (if (= (remainder i 3) 2)
	 				 (* 2 
	 				    (+ 1
	 				     (/ (- i 2)
	 				     	3)))
	 				 1  
	 				 ))
    100)


((lambda (i) (if (= (remainder i 3) 2)
	 				 (* 2 
	 				    (+ 1
	 				     (/ (- i 2)
	 				     	3)))
	 				 1  
	 				 )) 1)