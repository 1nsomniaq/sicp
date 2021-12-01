(define (append list1 list2) (if (null? list1)
list2
(cons (car list1) (append (cdr list1) list2))))

(define (reverse x)
	(if (null? (cdr x))
	    x
		(append (reverse (cdr x)) (cons (car x) '()))))

(define one-through-four (list 1 2 3 4))
(define a (reverse one-through-four))
one-through-four

(define one-two (list 1 2))

(reverse one-two)


(define one-three (list 1 2 3))

(reverse one-three)
