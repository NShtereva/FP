#lang racket

(define (reverse-number n) 
    (define (helper num result) (if (= num 0)
                                    result
                                    (helper (quotient num 10) (+ (* result 10) (remainder num 10)))))
    (helper n 0))

(define (palidrome? n) (= n (reverse-number n)))

(define (count-palindromes a b) (cond [(> a b) 0]
                                      [(palidrome? a) (+ 1 (count-palindromes (+ a 1) b))]
                                      [else (count-palindromes (+ a 1) b)]))    
