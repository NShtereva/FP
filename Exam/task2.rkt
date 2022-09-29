#lang racket

(define (rf f g) 
    (define (helper ns h) (cond [(null? ns) `()]
                                [(> (f (car ns)) (g (car ns))) (cons (h (car ns)) (helper (cdr ns) h))]
                                [else (helper (cdr ns) h)]))
    helper)

((rf (lambda (x) (* 2 x)) (lambda (x) (+ 2 x))) '(1 2 3 4 5) (lambda (x) (* 3 x))) ; --> '(9 12 15)
