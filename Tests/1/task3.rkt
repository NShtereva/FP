#lang racket

(define (shuffle xs)
    (define l1 (take xs (/ (length xs) 2)))
    (define l2 (drop xs (/ (length xs) 2)))
    (define (helper l1 l2) (if (null? l1)
                               `()
                               (append (list (car l1) (car l2)) (helper (cdr l1) (cdr l2)))))
    (helper l1 l2))

(shuffle '(2 5 1 3 4 7))        ; -> '(2 3 5 4 1 7)
(shuffle '(1 2 3 4 4 3 2 1))    ; -> '(1 4 2 3 3 2 4 1)
(shuffle '(1 1 2 2))            ; -> '(1 2 1 2)
