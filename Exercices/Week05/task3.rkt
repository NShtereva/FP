#lang racket

; a)
(define (repeated f n) 
    (define (helper f n x) (if (= n 0)
                               x
                               (f (helper f (- n 1) x))))
    (lambda (x) (helper f n x)))

; ((repeated (λ (x) (+ x 1)) 5) 1)

; b)
(define (my-compose f g) (lambda (x) (f (g x))))

(define (repeated-c f n) (if (= n 1)
                             f
                             (my-compose f (repeated-c f (- n 1)))))

; ((repeated-c (λ (x) (+ x 1)) 5) 1)
