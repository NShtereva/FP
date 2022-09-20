#lang racket

(define (sum-divisors n)
    (define (helper d sum) (cond [(= d n) sum]
                                 [(= (remainder n d) 0) (helper (+ d 1) (+ sum d))]
                                 [else (helper (+ d 1) sum)]))
    (helper 1 0))

(define (perfect-number? n) (= n (sum-divisors n)))
