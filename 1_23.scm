(define (smallest-divisor f n)
	(f n 2))

(define (square x) 
	(* x x))

(define (divide? a b)
	( = (remainder b a) 0 ))

(define (next n)
	(if (= n 2)
		3
		(+ n 2))
	)

(define (fast-find-divisor n div)
   (cond ((> (square div) n) n)
   	     ((divide? div n) div)
   	     (else (fast-find-divisor n (+ 1 div)))))

(define (find-divisor n div)
   (cond ((> (square div) n) n)
   	     ((divide? div n) div)
   	     (else (find-divisor n (next div)))))

(define (timed-prime-test n)
   (newline)
   (display n)
   (and (start-prime-test fast-find-divisor n (runtime))
   (start-prime-test find-divisor n (runtime))))

(define (start-prime-test f n start-time)
	(if (smallest-divisor f n) 
	    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))


(timed-prime-test 100000000003)
(timed-prime-test 100000000019)
(timed-prime-test 100000000057)
(timed-prime-test 1000000000039)
(timed-prime-test 1000000000061)
(timed-prime-test 1000000000063)
(timed-prime-test 10000000000037)
(timed-prime-test 10000000000051)
(timed-prime-test 10000000000099)
(timed-prime-test 100000000000031)
(timed-prime-test 100000000000067)
(timed-prime-test 100000000000097)
