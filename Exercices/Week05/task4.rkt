#lang racket

; a)
(define (sum-digit-divisors n) 
    (define (helper new-n sum) (cond [(= new-n 0) sum]
                                     [(and (not (= (remainder new-n 10) 0)) (= (remainder n (remainder new-n 10)) 0)) 
                                      (helper (quotient new-n 10) (+ sum (remainder new-n 10)))]
                                     [else (helper (quotient new-n 10) sum)]))
    (helper n 0))

; b)
(define (same-sum a b) 
    (define (helper m n counter) (cond [(>= m b) counter]
                                       [(and (= n b) (= (sum-digit-divisors m) (sum-digit-divisors n))) 
                                        (helper (+ m 1) (+ m 2) (+ counter 1))]
                                       [(and (= n b) (not (= (sum-digit-divisors m) (sum-digit-divisors n)))) 
                                        (helper (+ m 1) (+ m 2) counter)]
                                       [(= (sum-digit-divisors m) (sum-digit-divisors n)) 
                                        (helper m (+ n 1) (+ counter 1))]
                                       [else (helper m (+ n 1) counter)]))
    (helper a (+ a 1) 0))
