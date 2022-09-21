#lang racket

(define (suffix? a b) (cond [(< a 10) (= a (remainder b 10))]
                            [(not (= (remainder a 10) (remainder b 10))) #f]
                            [else (suffix? (quotient a 10) (quotient b 10))] ))

(define (substr? a b) (and (<= a b)
                           (or (suffix? a b) (substr? a (quotient b 10)))))
