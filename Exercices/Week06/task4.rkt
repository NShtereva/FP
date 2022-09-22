#lang racket

(define (min-element l) 
    (define (helper temp-min l) (cond [(null? l) temp-min]
                                      [(< (car l) temp-min) (helper (car l) (cdr l))]
                                      [else (helper temp-min (cdr l))]))
    (helper (car l) (cdr l)))

(define (min-element-1 l) (if (null? (cdr l))
                              (car l)
                              (min (car l) (min-element-1 (cdr l)))))
