#lang racket

(define (max x y) (cond [(> x y) x] 
                        [else y]))
