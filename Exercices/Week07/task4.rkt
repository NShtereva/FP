#lang racket

(define (ordered? xs pred) (if (<= (length xs) 1)
                               #t
                               (and (pred (car xs) (cadr xs)) (ordered? (cdr xs) pred))))

(ordered? '(1 2 3 6 7) (lambda (a b) (< a b))) ; -> #t
(ordered? '(7 6 5 4 6) (lambda (a b) (> a b))) ; -> #f
