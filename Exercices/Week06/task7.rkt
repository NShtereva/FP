#lang racket

(define (concat l1 l2) (if (null? l1) 
                           l2
                           (cons (car l1) (concat (cdr l1) l2))))
