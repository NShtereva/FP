#lang racket

(define (prime? n) 
    (define (helper temp) (if (= temp n)
                              #t
                              (and (not (= (remainder n temp) 0))
                                   (helper (+ temp 1)))))
    (cond [(< n 2) #f]
          [(= (remainder n 2) 0) (= n 2)]
          [else (helper 3)]))

(define (factorize n)
    (define (helper d curr-n result) (cond [(> d curr-n) (reverse result)]
                                           [(and (prime? d) (= (remainder curr-n d) 0)) (helper d (quotient curr-n d) (cons d result))]
                                           [else (helper (+ d 1) curr-n result)]))
    (helper 2 n `()))

(factorize 6)    ; -> '(2 3)
(factorize 13)   ; -> '(13)
(factorize 123)  ; -> '(3 41)
(factorize 152)  ; -> '(2 2 2 19)
