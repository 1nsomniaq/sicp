(define (timed-prime-test n)
   (newline)
   (display n)
   (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
	(if (prime? n) 
	    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
	(display " *** ")
	(display elapsed-time))

(define (square n)
	(* n n))

(define (find-div n)
     (test-div n 2))

(define (divide? a b)
	(= 0 (remainder b a)))

(define (test-div n div)
	(cond ((> (square div) n ) n)
		  ((divide? div n) div)
		  (else (test-div n (+ div 1)))))

(define (prime? n)
     (= (find-div n) n)
	)

(define (find-next-prime n)
	(if (prime? n)
	     (and (timed-prime-test n) n)
	     (find-next-prime (+ n 2))))

(define (search-for-first-n-primes n count)
	(cond ((= count 0) 0)
          (else (search-for-first-n-primes (find-next-prime (+ n 2)) (- count 1)))))

(define (search-for-primes n)
	(search-for-first-n-primes n 3))


(search-for-primes 1001)
(search-for-primes 10001)
(search-for-primes 100001)
(search-for-primes 1000001)
(search-for-primes 100000001)
(search-for-primes 100000000001)
(search-for-primes 1000000000001)


; 100000000001 takes .24 sec
; 1000000000001 takes .73 sec
; .73/.24 approx = 3