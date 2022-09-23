#lang racket

(define(has-matching-lengths? l1 l2)
    (define (helper l1 l2 d)
        (cond [(null? l1) #t]
              [(not (= (- (length (car l2)) (length (car l1))) d)) #f]
              [else (helper (cdr l1) (cdr l2) d)]))
    (if (not (= (length l1) (length l2)))
        #f
        (helper (cdr l1) (cdr l2) (- (length (car l2)) (length (car l1))))))

(has-matching-lengths? '((1 2) (1 2) (1 3)) '((4) (5) (6))) ; -> #t
(has-matching-lengths? '((1) (2) (3)) '((4 4) (6) (7))) ; -> #f
