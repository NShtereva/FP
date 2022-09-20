#lang racket

(define (reverse-number n) 
    (define (helper num result) (if (= num 0)
                                    result
                                    (helper (quotient num 10) (+ (* result 10) (remainder num 10)))))
    (helper n 0))
