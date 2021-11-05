(define (find-div n)
	(test-div n 2))

(define (square x) 
	(* x x))

(define (remainder a b)
	(if (< a b)
	     a
	     (remainder (- a b) b)))

(define (divide? a b)
	( = (remainder b a) 0 ))

(define (test-div n div)
   (cond ((> (square div) n) n)
   	     ((divide? div n) div)
   	     (else (test-div n (+ div 1)))))

(find-div 199)
(find-div 1999)
(find-div 19999)