#lang racket

(define (count-divisors n)
    (define (helper d counter) (cond [(> d n) counter]
                                     [(= (remainder n d) 0) (helper (+ d 1) (+ counter 1))]
                                     [else (helper (+ d 1) counter)]))
    (helper 1 0))
