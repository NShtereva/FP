#lang racket

(define (cube n) (* n n n))

(define (prime? n) 
    (define (helper temp) (if (= temp n)
                              #t
                              (and (not (= (remainder n temp) 0))
                                   (helper (+ temp 1)))))
    (cond [(< n 2) #f]
          [(= (remainder n 2) 0) (= n 2)]
          [else (helper 3)]))

(define (nth-cuban n)
    (define (helper a b counter) (cond [(= counter n) (- (cube (- a 1)) (cube (- b 1)))]
                                       [(prime? (- (cube a) (cube b))) (helper (+ a 1) (+ b 1) (+ counter 1))]
                                       [else (helper (+ a 1) (+ b 1) counter)]))
    (helper 2 1 0))

(nth-cuban 1)   ; -> 7 (2^3 - 1^3)
(nth-cuban 4)   ; -> 61 (5^3 - 4^3)
(nth-cuban 50)  ; -> 55897 (137^3 - 136^3)
(nth-cuban 100) ; -> 283669 (308^3 - 307^3)
