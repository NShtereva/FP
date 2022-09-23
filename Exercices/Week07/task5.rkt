#lang racket

(define (max-ordered-prefix xs) (cond [(<= (length xs) 1) xs]
                                      [(> (car xs) (cadr xs)) (list (car xs))]
                                      [else (cons (car xs) (max-ordered-prefix (cdr xs)))]))

(define (max-ordered-sublist xs)
    (define (helper xs max-subxs)
        (define cur-ord-pre (max-ordered-prefix xs))
        (cond [(null? xs) max-subxs]
              [(> (length cur-ord-pre) (length max-subxs)) (helper (drop xs (length cur-ord-pre)) cur-ord-pre)]
              [else (helper (drop xs (length cur-ord-pre)) max-subxs)]))
    (helper xs `()))
