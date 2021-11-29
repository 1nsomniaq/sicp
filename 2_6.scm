(define zero (lambda (f)(lambda (x) x)))

(define one (lambda (f)(lambda (x) (f x))))

(define two (lambda (f)(lambda (x) (f (f x)))))



(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x)))))

(define (plus n m) (lambda (f) (lambda (x) ((m f) ((n f) x)))))


(add-1 zero) 



(define (square x) (* x x))

((zero square) 2)



((one square) 2)



(((add-1 one) square) 2)

((two square) 2)

(((plus one two) square) 2)

; (add-1 zero) 

; (add-1 (lambda (f)(lambda (x) x))) 

; (lambda (f) (lambda (x) (f ((n f) x))))

; (n f) -> ((lambda (f)(lambda (x) x)) f) => (lambda (x) x)

; (lambda (f) (lambda (x) (f ((lambda (x) x) x))))

; ((lambda (x) x) x) -> x

; (lambda (f) (lambda (x) (f x)))


