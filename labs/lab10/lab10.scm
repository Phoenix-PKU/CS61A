;(define (over-or-under num1 num2) 
;    (if (< num1 num2) -1 (if (= num1 num2) 0 1)))
(define (over-or-under num1 num2) 
    (cond ((< num1 num2) -1)
          ((> num1 num2)  1)
          (else 0)))

(define (make-adder num) 
    (define (adder inc) (+ num inc)) adder)

(define (composed f g) 
    (define (f-g x) (f (g x)))
    f-g)

;(define lst 
;    (cons '(1) (cons 2 
;        (cons (cons 3 (cons 4 nil)) (cons 5 nil)))))

(define lst (list '(1) 2 '(3 4) 5))

(define (duplicate lst) (if (null? lst) nil
    (cons (car lst) (cons (car lst)  (duplicate (cdr lst)))) ))
