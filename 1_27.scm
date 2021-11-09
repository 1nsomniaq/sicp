(define (timed-prime-test n)
   (newline)
   (display n)
   (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (check-carmichael-number n (- n 1)) 
	    (report-prime (- (runtime) start-time))
	    (display " is not prime ")))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (check-carmichael-number n curr)
	(cond ((= curr 0) true)
		  ((fermat-test n curr)(check-carmichael-number n (- curr 1)))
		  (else false)))

(define (fermat-test n curr)
		(= (expmod curr n n) curr))

(define (expmod base exp m)
	(cond ((= exp 0 ) 1)
		  ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
		  (else (remainder (* base (expmod base (- exp 1) m))m))))
	


(timed-prime-test 561)
(timed-prime-test 1105)
(timed-prime-test 1729)
(timed-prime-test 2465)
(timed-prime-test 2821)
(timed-prime-test 66601)



(timed-prime-test 100)
(timed-prime-test 11122)
(timed-prime-test 32)
