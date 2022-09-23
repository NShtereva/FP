#lang racket

(define (automorphic? n) 
    (define (helper n sqr-n) (if (= n 0)
                                 #t
                                 (and (= (remainder n 10) (remainder sqr-n 10))
                                      (helper (quotient n 10) (quotient sqr-n 10)))))
    (helper n (* n n)))

(automorphic? 5)        ; -> #t
(automorphic? 25)       ; -> #t
(automorphic? 36)       ; -> #f
(automorphic? 890625)   ; -> #t
