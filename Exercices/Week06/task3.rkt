#lang racket

(define (insert-at pos x l) (if (or (= pos 0) (null? l))
                                (cons x l)
                                (cons (car l) (insert-at (- pos 1) x (cdr l)))))
