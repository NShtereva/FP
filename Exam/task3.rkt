#lang racket

; a)
(define (line p1 p2) (lambda (x) (+ (cdr p1) 
                                    (/ (* (- x (car p1)) (- (cdr p2) (cdr p1)))
                                       (- (car p2) (car p1))
                                    ))))

; b)
(define (liesOn f) (lambda (point) (= (cdr point) (f (car point)))))

(define diagonal (line (cons 0 0) (cons 1 1)))
(define onDiag (liesOn diagonal))

(diagonal 5.5)          ; --> 5.5
(diagonal 0.5)          ; --> 0.5
(onDiag (cons 5.5 5.5)) ; --> #t
(onDiag (cons 0.5 0))   ; --> #f
