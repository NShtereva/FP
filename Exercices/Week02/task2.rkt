#lang racket

(define (leap-year? year) (or 
                           (and (= (remainder year 4) 0) (not (= (remainder year 100) 0)))
                           (= (remainder year 400) 0)
                          ))
