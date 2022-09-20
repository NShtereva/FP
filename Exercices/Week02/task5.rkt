#lang racket

(define (prime? n) 
    (define (helper d) (cond [(= d n) #t]
                             [(= (remainder n d) 0) #f]
                             [else (helper (+ d 2))]))
    (cond [(< n 2) #f]
          [(= (remainder n 2) 0) (= n 2)]
          [else (helper 3)]))
