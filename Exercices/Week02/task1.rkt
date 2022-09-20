#lang racket

(define (mygcd a b) (cond [(= a b) a]
                          [(> a b) (mygcd (- a b) b)]
                          [else (mygcd a (- b a))]))
