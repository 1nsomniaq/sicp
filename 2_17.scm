(define (last-pair x)
	(if (null? (cdr x))
		(list (car x))
		(last-pair (cdr x)))
	)


(define one-through-four (list 1 2 3 4))

(last-pair one-through-four)
(last-pair (list 1))

(last-pair (cons '() '()))