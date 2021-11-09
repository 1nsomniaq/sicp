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

1 ]=> (timed-prime-test 100000000003)
100000000003 *** .22999999999999998 *** .15000000000000002
;1.52

1 ]=> (timed-prime-test 100000000019)
100000000019 *** .22999999999999998 *** .14
;Unspecified return value

1 ]=> (timed-prime-test 100000000057)
100000000057 *** .22999999999999998 *** .1399999999999999
;Unspecified return value

1 ]=> (timed-prime-test 1000000000039)
1000000000039 *** .6900000000000002 *** .4299999999999997
;Unspecified return value

1 ]=> (timed-prime-test 1000000000061)
1000000000061 *** .73 *** .43000000000000016
;Unspecified return value

1 ]=> (timed-prime-test 1000000000063)
1000000000063 *** .6999999999999997 *** .4400000000000004
;Unspecified return value

1 ]=> (timed-prime-test 10000000000037)
10000000000037 *** 2.21 *** 1.3400000000000007
;Unspecified return value

1 ]=> (timed-prime-test 10000000000051)
10000000000051 *** 2.2399999999999984 *** 1.42
1.57

1 ]=> (timed-prime-test 10000000000099)
10000000000099 *** 2.280000000000001 *** 1.3900000000000006
;Unspecified return value

1 ]=> (timed-prime-test 100000000000031)
100000000000031 *** 7.379999999999999 *** 4.43
;Unspecified return value

1 ]=> (timed-prime-test 100000000000067)
100000000000067 *** 7.510000000000002 *** 4.439999999999998
;Unspecified return value

1 ]=> (timed-prime-test 100000000000097)
100000000000097 *** 7.32 *** 4.310000000000002
;Unspecified return value

