#lang racket

(define (size l) (if (null? l)
                       0
                       (+ 1 (size (cdr l)))))
