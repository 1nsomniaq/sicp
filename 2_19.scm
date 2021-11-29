(define (cc amount coin-values) 
	(cond ((= amount 0) 1)
           ((or (< amount 0) (no-more? coin-values)) 0) 
           (else (+ (cc amount (except-first-denomination coin-values))
					(cc (- amount (first-denomination coin-values)) coin-values)))))

(define (no-more? x)
	(null? x))

(define (first-denomination x)
	(car x)
	)

(define (except-first-denomination x)
	(cdr x))

(define (reverse x)
	(if (null? (cdr x))
	    x
		(append (reverse (cdr x)) (cons (car x) '()))))

(define (append list1 list2) 
	(if (null? list1)
		list2
		(cons (car list1) (append (cdr list1) list2))))

(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(cc 100 us-coins)

(define us-coins-reversed (reverse us-coins))

(cc 100 us-coins-reversed)