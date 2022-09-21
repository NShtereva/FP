#lang racket

; a)
(define (my-identity x) x)

; b)
(define (my-compose f g) (lambda (x) (f (g x))))

;((my-compose (lambda (x) (+ 1 x)) (lambda (x) (* x 2))) 5)

; c)
(define (my-negate p?) (lambda (x) (not p? x)))

; d)
(define (my-curry f a) (lambda (b c) (f a b c)))
