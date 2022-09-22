#lang racket

(define (reverse l) 
    (define (helper l rev-l) (if (null? l)
                                 rev-l
                                 (helper (cdr l) (cons (car l) rev-l))))
    (helper l `()))
