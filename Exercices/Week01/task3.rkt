#lang racket

(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))
(define (myfunc x y) (average (square x) (square y)))
