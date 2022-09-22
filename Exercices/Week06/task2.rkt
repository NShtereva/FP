#lang racket

(define (member? x l) (if (null? l)
                         #f
                         (or (equal? x (car l)) (member? x (cdr l)))))
