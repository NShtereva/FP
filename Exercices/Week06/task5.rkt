#lang racket

(define (erase-first x l) (cond [(null? l) l]
                                [(equal? x (car l)) (cdr l)]
                                [else (cons (car l) (erase-first x (cdr l)))]))
