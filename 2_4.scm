(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(define (cdr z)
  (z (lambda (p q) q)))

; (define (car z)
  ; (z (lambda (p q) p)))


; (define (car z)
  ; ((lambda (m) (m x y)) (lambda (p q) p))) 


; (define (car z)
  ; (lambda (p q) p) x y))


  (define a (cons 1 2))

  (car a)
  (cdr a)