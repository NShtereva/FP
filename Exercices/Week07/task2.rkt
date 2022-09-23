#lang racket

(define (sublistBetween-1 start end xs) 
    (define (helper counter xs) (cond [(or (null? xs) (> counter end)) `()]
                                      [(< counter start) (helper (+ counter 1) (cdr xs))]
                                      [else (cons (car xs) (helper (+ counter 1) (cdr xs)))]))
    (helper 0 xs))

(define (sublistBetween-2 start end xs) (if (or (null? xs) (> start end))
                                           `()
                                           (take (drop xs start) (+ (- end start) 1))))

(sublistBetween-1 3 10 (range 20))
(sublistBetween-2 3 10 (range 20))
