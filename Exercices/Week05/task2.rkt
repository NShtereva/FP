#lang racket

(define (derive f eps) (lambda (x) (/ (- (f (+ x eps)) (f x)) eps)))

(define (derive-n f n eps) (if (= n 0)
                               f
                               (derive (derive-n f (- n 1) eps) eps)))
