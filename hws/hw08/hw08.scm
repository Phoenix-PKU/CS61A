(define (my-filter pred s) 
  (if (null? s) nil 
  (if (pred (car s)) (cons (car s) (my-filter pred (cdr s))) 
    (my-filter pred (cdr s)) )))

(define (interleave lst1 lst2) 
  (cond ((and (null? lst1) (null? lst2)) nil)
        ((null? lst1)   lst2)
        ((null? lst2)   lst1)
        (else   (cons (car lst1) (cons (car lst2) (interleave (cdr lst1) (cdr lst2)))))))

(define (accumulate joiner start n term)
  (if (= n 0) start 
  (accumulate joiner (joiner start (term n)) (- n 1)  term)))

(define (in-list? elem s) 
  (if (null? s) false 
   (or (= elem (car s)) (in-list? elem (cdr s))) ) )

(define (no-repeats lst) 
  (define (no-repeats-helper cur_lst lst) 
    (if (null? lst) cur_lst
      (if (in-list? (car lst) cur_lst) (no-repeats-helper cur_lst (cdr lst))
      (no-repeats-helper (append cur_lst (list (car lst))) (cdr lst)))
    )
  )
  (no-repeats-helper nil lst) )
