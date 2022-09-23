#lang racket

(define (atom? x) (not (pair? x)))

(define (flatten xss) (cond [(null? xss) `()]
                            [(atom? (car xss)) (cons (car xss) (flatten (cdr xss)))]
                            [else (append (flatten (car xss)) (flatten (cdr xss)))]))

(flatten '((1 2 3) (4 5 6) ((7 8) (9 10 (11 (12)))))) ; -> '(1 2 3 4 5 6 7 8 9 10 11 12)
