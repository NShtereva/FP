#lang racket

(define (removeDuplicates xs) (if (null? xs) 
                                  xs
                                  (cons (car xs) 
                                        (removeDuplicates (filter (lambda (x) (not (= (car xs) x)))) (cdr xs)))))
