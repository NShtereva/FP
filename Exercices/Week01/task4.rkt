#lang racket

(define (fib n) (if (or (= n 1) (= n 2))
                    1
                    (+ (fib (- n 1)) (fib (- n 2)))))




(define (fibIterHelper prev curr n) (if (= n 1)
                                        curr
                                        (fibIterHelper curr
                                                       (+ prev curr)
                                                       (- n 1))))

(define (fibIter n) (fibIterHelper 0 1 n))
