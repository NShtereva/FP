#lang racket

(define (mysum x n) 
    (define (helper temp sum) (if (> temp n)
                                  sum
                                  (helper (+ temp 1) (+ sum (expt x temp)))))
    (helper 0 0))
