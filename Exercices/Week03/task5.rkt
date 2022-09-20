#lang racket

(define (inc-digits? n) (cond [(< n 10) #t]
                              [(< (remainder n 10) (remainder (quotient n 10) 10)) #f]
                              [else (inc-digits? (quotient n 10))]))
