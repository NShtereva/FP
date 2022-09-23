#lang racket

(define (countOccurrences subxs xs) (cond [(null? xs) 0]
                                          [(> (length subxs) (length xs)) 0]
                                          [(equal? subxs (take xs (length subxs))) (+ 1 (countOccurrences subxs (cdr xs)))]
                                          [else (countOccurrences subxs (cdr xs))]))

(countOccurrences '(1 2) '(1 2 2 1 2))      ; -> 2
(countOccurrences '(1 1) '(1 2 2 1 1 1 2))  ; -> 2
