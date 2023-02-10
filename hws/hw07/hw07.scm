(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (ascending? asc-lst) (if (null? asc-lst) true
    (if (null? (cdr asc-lst)) true
        (and (<= (car asc-lst) (cadr asc-lst)) (ascending? (cdr asc-lst))) )))

(define (square n) (* n n))

(define (module n k) (- n (* k (quotient n k))))

(define (pow base exp) 
    (define half (quotient exp 2))
    (cond ((= exp 0) 1)   ((= exp 1) base)
          ((= 0 (module exp 2)) (square (pow base half)))
          (else (* (square (pow base half)) base))))

