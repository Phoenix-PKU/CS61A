(define (when condition exprs)
  `(if ,condition (begin ,@exprs) 'okay))

(when '(= 1 1) '((print 6) (print 1) 'a))

(define-macro (when condition exprs)
  `(if ,condition (begin ,@exprs) 'okay))

(define (switch expr cases)
  (cons 'cond
        (map (lambda (case)
               (cons `(= ,expr ,(car case))
                     (cdr case)))
             cases)))

(define-macro (switch expr cases)
  (cons 'cond
        (map (lambda (case)
               (cons `(= ,expr ,(car case))
                     (cdr case)))
             cases)))
