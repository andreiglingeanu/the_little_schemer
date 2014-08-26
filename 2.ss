#lang scheme

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define lat?
  (lambda (l)
    (cond
      ((null? l) #t)
      ((atom? (car l)) (lat? (cdr l)))
      (else #f))))

(lat? '(Jack Sprat could eat no chicken fat))
(lat? '(bacon and eggs))
(lat? '(bacon (eggs) chicken))

(or (null? '()) (null? '(egg bacon)))

(define member?
  (lambda (a lat)
    (cond
      ((null? lat) #f)
      (else (or (eq? (car lat) a)
                (member? a (cdr lat)))))))

(member? 'meat '(mashed potatoes and meat gravy))
(member? 'andrei '(vasea vanea valetin))
(member? 'andrei '(andrei vasea vanea valetin))

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                       THE FIRST COMMANDMENT                        |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
;  Always ask null? as the first question in expressing any function.

(member? 'liver '(bagels and lox))
