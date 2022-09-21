#lang racket

(define (difference F a b) (- (F b) (F a)))

(difference (lambda (x) (+ x 2)) 1 4)
