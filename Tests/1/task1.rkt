#lang racket

(define (number-of-digits n) (if (<= n 0)
                                 0
                                 (+ 1 (number-of-digits (quotient n 10)))))

(define (sum-of-digits n p) (if (<= n 0)
                                0
                                (+ (expt (remainder n 10) p) (sum-of-digits (quotient n 10) (- p 1)))))

(define (dig-pow n p) 
    (define (helper k sum) (cond [(> (* n k) sum) -1]
                                 [(= (* n k) sum) k]
                                 [else (helper (+ k 1) sum)]))
    (helper 1 (sum-of-digits n (+ (- (number-of-digits n) 1) p))))

(dig-pow 89 1)      ; -> 1 (8¹ + 9² = 89 = 89 * 1)
(dig-pow 92 1)      ; -> -1 (няма k – такова, че 9¹ + 2² = 92 * k)
(dig-pow 695 2)     ; -> 2 (6² + 9³ + 5⁴ = 1390 = 695 * 2)
(dig-pow 46288 3)   ; -> 51 (4³ + 6⁴ + 2⁵ + 8⁶ + 8⁷ = 2360688 = 46288 * 51)
