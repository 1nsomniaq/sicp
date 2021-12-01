(define square (lambda (x) (* x x)))


(define (square-list items)
	(if (null? items)
	'()
	(cons (square (car items)) (square-list (cdr items)))))

(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items)) (map proc (cdr items)))))

(define (square-list-map items) 
	(map square items))


(square-list (list 1 2 3 4))


(square-list-map (list 1 2 3 4))
