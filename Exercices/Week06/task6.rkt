#lang racket

(define (erase-all x l) (cond [(null? l) l]
                              [(equal? x (car l)) (erase-all x (cdr l))]
                              [else (cons (car l) (erase-all x (cdr l)))]))
