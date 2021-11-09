(define (prime? n)
	(check-prime n (- n 1)))

(define (check-prime n curr) 
	(cond ((= curr 0) true)
		  ((miller-rabin-test n curr)(check-prime n (- curr 1)))
		  (else false)))

(define (miller-rabin-test n curr)
		(= (expmod curr (- n 1) n) 1))

(define (expmod base exp m)
	(cond ((= exp 0 ) 1)
		  ((even? exp) (if (and (= 1 (remainder (square (expmod base (/ exp 2) m)) m))
		                   		(= exp (- m 1))
		                   		(= (- exp 1) 1))
		  	             0
		  	             (remainder (square (expmod base (/ exp 2) m)) m)))
		  (else (remainder (* base (expmod base (- exp 1) m)) m))))

(prime? 1)
(prime? 2)
(prime? 3)
(prime? 4)
(prime? 5)

; carmichael
(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
; (prime? 66601)


; even
(prime? 100)
(prime? 11122)
(prime? 32)

; primes
(prime? 157)
(prime? 163)
(prime? 167)
(prime? 173)
(prime? 179)
(prime? 181)
