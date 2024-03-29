(define-macro
 (if-macro condition if-true if-false)
    `(if ,condition ,if-true ,if-false))

;(define-macro
; (if-macro condition if-true if-false)
;    (list 'if condition if-true if-false))

(define-macro (or-macro expr1 expr2)
  `(let ((v1 ,expr1))
     (if v1 v1 ,expr2)))

(define (replicate x n) 
  (if (> n 0) (cons x (replicate x (- n 1)))
      nil))

(define-macro (repeat-n expr n) 
  `(if (> (eval ,n) 0) (begin ,expr (repeat-n ,expr ,(- (eval n) 1)))))

(define
 (list-of map-expr for var in lst if filter-expr)
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst) ))

(define-macro (list-of-macro map-expr
                             for
                             var
                             in
                             lst
                             if
                             filter-expr)
  `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst) ))
