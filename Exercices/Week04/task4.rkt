#lang racket

(define (f x) (* 2 x))
(define f1 (lambda (x) (* 2 x)))

(f 5)
(f1 5)
