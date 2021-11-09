(define (timed-prime-test n times)
   (newline)
   (display n)
   (start-prime-test n times (runtime)))

(define (start-prime-test n times start-time)
	(if (fast-prime? n times) 
	    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (fast-prime? n times)
	(cond ((= times 0) true)
		  ((fermat-test n) (fast-prime? n (- times 1)))
		  (else false)))

(define (fermat-test n)
	(define (try-it a)
		(= (expmod a n n) a))
	(try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
	(cond ((= exp 0 ) 1)
		  ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
		  (else (remainder (* base (expmod base (- exp 1) m))m))))
	


(timed-prime-test 100000000003 10000)
(timed-prime-test 100000000019 10000)
(timed-prime-test 100000000057 10000)
(timed-prime-test 1000000000039 10000)
(timed-prime-test 1000000000061 10000)
(timed-prime-test 1000000000063 10000)
(timed-prime-test 10000000000037 10000)
(timed-prime-test 10000000000051 10000)
(timed-prime-test 10000000000099 10000)
(timed-prime-test 100000000000031 10000)
(timed-prime-test 100000000000067 10000)
(timed-prime-test 100000000000097 10000)

1 ]=> (timed-prime-test 100000000003 10000)
100000000003 *** .48
;Unspecified return value

1 ]=> (timed-prime-test 100000000019 10000)
100000000019 *** .47
;Unspecified return value

1 ]=> (timed-prime-test 100000000057 10000)
100000000057 *** .44999999999999996
;Unspecified return value

1 ]=> (timed-prime-test 1000000000039 10000)
1000000000039 *** .47
;Unspecified return value

1 ]=> (timed-prime-test 1000000000061 10000)
1000000000061 *** .47
;Unspecified return value

1 ]=> (timed-prime-test 1000000000063 10000)
1000000000063 *** .48
;Unspecified return value

1 ]=> (timed-prime-test 10000000000037 10000)
10000000000037 *** .4900000000000002
;Unspecified return value

1 ]=> (timed-prime-test 10000000000051 10000)
10000000000051 *** .5
;Unspecified return value

1 ]=> (timed-prime-test 10000000000099 10000)
10000000000099 *** .5
;Unspecified return value

1 ]=> (timed-prime-test 100000000000031 10000)
100000000000031 *** .5599999999999996
;Unspecified return value

1 ]=> (timed-prime-test 100000000000067 10000)
100000000000067 *** .54
;Unspecified return value

1 ]=> (timed-prime-test 100000000000097 10000)
100000000000097 *** .54
