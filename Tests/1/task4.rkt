#lang racket

(define (triangular? mat)
    (define (correct? row k) (if (= k 0)
                                 #t
                                 (and (= (car row) 0) (correct? (cdr row) (- k 1)))))
    (define (helper mat k) (if (null? mat)
                               #t
                               (and (correct? (car mat) k) (helper (cdr mat) (+ k 1)))))
    (helper mat 0))

(triangular? '((1 2 3)
               (0 5 6)
               (0 0 9)))    ; -> #t

(triangular? '((0 2 3)
               (0 0 6)
               (1 0 0)))    ; -> #f

(triangular? '((1 2 3)
               (1 5 6)
               (0 0 9)))    ; -> #f

(triangular? '((1 2 3 4)
               (0 5 6 7)
               (0 0 8 9)
               (0 0 0 9)))  ; -> #t
