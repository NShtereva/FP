#lang racket

(define (sum-odds-iter a b) 
    (define (helper a b sum) (cond [(> a b) sum]
                                   [(= (remainder a 2) 1) (helper (+ a 2) b (+ sum a))]
                                   [else (helper (+ a 1) b sum)]))
    (helper a b 0))



(define (sum-odds a b) (cond [(> a b) 0]
                             [(= (remainder a 2) 1) (+ a (sum-odds (+ a 2) b))]
                             [else (sum-odds (+ a 1) b)]))
