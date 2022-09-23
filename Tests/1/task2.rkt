#lang racket

(define (get-sorted-neg xs result) (cond [(null? xs) (sort result >)]
                                         [(< (car xs) 0) (get-sorted-neg (cdr xs) (cons (car xs) result))]
                                         [else (get-sorted-neg (cdr xs) result)]))

(define (remove-duplicates-in-sorted xs) (cond [(null? xs) `()]
                                               [(= (length xs) 1) xs]
                                               [(= (car xs) (cadr xs)) (remove-duplicates-in-sorted (cdr xs))]
                                               [else (cons (car xs) (remove-duplicates-in-sorted (cdr xs)))]))

(define (kth-max-min xs) 
    (define (helper k lst) (if (< (length lst) k) 
                               (error "No such number")
                               (car (drop lst (- k 1)))))
    (lambda (k) (helper k (remove-duplicates-in-sorted (get-sorted-neg xs `())))))

((kth-max-min '(1 2 3 4 -5 6 7 -2 -1 0)) 2) ; -> -2
((kth-max-min '(-1 0 -1 0 -2 3 1 -1)) 5)    ; -> No such number
