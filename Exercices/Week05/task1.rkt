#lang racket

(define (derive f eps) (lambda (x) (/ (- (f (+ x eps)) (f x)) eps)))

(define (derive2 f eps) (derive (derive f eps) eps))
