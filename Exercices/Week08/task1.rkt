#lang racket

(define (best-metric? ms xss)
    (define applied-metrics (map (lambda (m) (map m xss)) ms))
    (define (helper aps)
        (cond [(null? aps) #f]
              [(andmap (lambda (m) (andmap >= (car aps) m)) applied-metrics) #t]
              [else (helper (cdr aps))]))
    (helper applied-metrics))

(define (prod xs) (apply * xs))
(define (sum xs) (apply + xs))

(best-metric? (list sum prod) `((0 1 2) (3 -4 5) (1337 0)))  ; -> #t
(best-metric? (list car sum) `((100 -100) (29 1) (42)))      ; -> #f
