#lang racket

(define (mymaxdivisor x) 
    (define (helper x d) (if (= (remainder x d) 0) 
                             d
                             (helper x (- d 1))))
    (helper x (- x 1)))
