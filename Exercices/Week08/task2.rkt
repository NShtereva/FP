#lang racket

(define (atom? x) (not (pair? x)))

(define (deep-delete ls)
    (define (helper level lscur)
        (cond [(null? lscur) '()]
              [(list? (car lscur)) (cons (helper (+ level 1) (car lscur)) (helper level (cdr lscur)))]
              [(< (car lscur) level) (helper level (cdr lscur))]
              [else (cons (car lscur) (helper level (cdr lscur)))]))
    (helper 1 ls))

(deep-delete '(1 (2 (2 4) 1) 0 (3 (1)))) ; -> (1 (2 (4)) (3 ())))
