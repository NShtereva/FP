#lang racket

(define (derive f eps) (lambda (x) (/ (- (f (+ x eps)) (f x)) eps)))

((derive (lambda (x) (* 2 x x)) 0.001) 1)
