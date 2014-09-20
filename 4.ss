#lang scheme

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

(define add1
  (lambda (n)
    (+ n 1)))

(define sub1
  (lambda (n)
    (- n 1)))

(atom? 14)
(atom? -3)
(atom? 3.14159)

(add1 67)

(sub1 5)
(sub1 0)

(zero? 0)
(zero? 1492)

(+ 46 12)

; (define +
;   (lambda (n m)
;     (cond
;       ((zero? m) n)
;       (else (add1 (+ n (sub1 m)))))))

(+ 2 2)
(- 14 3)
(- 17 9)
(- 18 25)

; (define -
;   (lambda (n m)
;     (cond
;       ((zero? m) n)
;       (else (sub1 (- n (sub1 m)))))))

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |               THE FIRST COMMANDMENT (first revision)               |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
;
; When recurring on a list of atoms, lat, ask two questions
; about it: (null? lat) and else.
; When recurring on a number, n, ask two questions about
; it: (zero? n) and else.

(define addtup
  (lambda (tup)
    (cond
      ((null? tup) 0)
      (else (+ (car tup) (addtup (cdr tup)))))))

(addtup '(1 2 3))

(* 5 3)
(* 13 4)

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
; |              THE FOURTH COMMANDMENT (first revision)               |
; ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; Always change at least one argument while recurring. It
; must be change to be closer to termination. The changing
; argument must be tested in the termination condition:
; when using cdr, test termination with null? and
; when using sub1, test termination with zero?.

#; (define mult
  (lambda (n m)
    (cond
      ((zero? m) 0)
      (else (+ n ((mult n (sub1 m))))))))

; (mult 12 3)

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
; |                       THE FIFTH COMMANDMENT                        |
; ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; When building a value with +, always use 0 for the value of the
; terminating line, for adding 0 does not change the value of an
; addition.
;
; When building a value with *, always use 1 for the value of the
; terminating line, for multiplying by 1 does not change the value
; of a multiplication.
;
; When building a value with cons, always consider () for the value
; of the terminating line.

(define tup+
  (lambda (tup1 tup2)
    (cond
      ((null? tup1) tup2)
      ((null? tup2) tup1)
      (else
        (cons (+ (car tup1) (car tup2))
              (tup+ (cdr tup1) (cdr tup2)))))))

(tup+ '(3 6 9 11 4) '(8 5 2 0 7)) ; (11 11 11 11 11)
(tup+ '(2 3) '(4 6)) ; (6 9)

(tup+ '(3 7) '(4 6)) ; (7 13)
; (tup+ ('1 2) '(1 2 3 4)) ; (2 4 3 4)

(> 12 133) ; #f
(> 120 11) ; #t

(define grt
  (lambda (n m)
    (cond
      ((zero? n) #f)
      ((zero? m) #t)
      (else (> (sub1 n) (sub1 m))))))

(grt 1 2)
(grt 3 1)
(grt 3 3)

(< 4 6) ; #t
(< 8 3) ; #f
(< 6 6) ; #f
(define lst
  (lambda (n m)
    (cond
      ((zero? m) #f)
      ((zero? n) #t)
      (else
        (lst (sub1 n) (sub1 m))))))

(lst 1 2)
(lst 1 1)

(define eql
  (lambda (n m)
    (cond
      ((zero? m) (zero? n))
      ((zero? n) #f)
      (else (eql (sub1 n) (sub1 m))))))

(define eql2
  (lambda (n m)
    (cond
      ((> n m) #f)
      ((< n m) #f)
      (else #t))))

(define pow
  (lambda (n m)
    (cond
      ((zero? m) 1)
      (else (* n (pow n (sub1 m)))))))

(pow 1 1) ; 1
(pow 2 3) ; 8
(pow 5 3) ; 125

(define div
  (lambda (n m)
    (cond
      ((< n m) 0)
      (else (add1 (div (- n m) m))))))

(define length
  (lambda (lat)
    (cond
      ((null? lat) 0)
      (else (add1 (length (cdr lat)))))))

(length '(hotdogs with mustard sauerkraut and pickles)) ; 6
(length '(ham and cheese on rye)) ; 5

(define pick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (car lat))
      (else (pick (sub1 n) (cdr lat))))))

(pick 4 '(lasagna spaghetti ravioli macaroni meatball)) ; macaroni

(define rempick
  (lambda (n lat)
    (cond
      ((zero? (sub1 n)) (cdr lat))
      (else (cons (car lat)
                  (rempick (sub1 n) (cdr lat)))))))

(rempick 3 '(hotdogs with hot mustard)) ; (hotdogs with mustard)

(number? 'tomato)
(number? 76)

(define no-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((number? (car lat)) (no-nums (cdr lat)))
              (else (cons (car lat) (no-nums (cdr lat)))))))))

(no-nums '(a 1 2 b 3 c))

(define all-nums
  (lambda (lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((number? (car lat))
           (cons (car lat)
                 (all-nums (cdr lat))))
          (else (all-nums (cdr lat))))))))

(all-nums '(a b 1 2 3 c 4))

(define eqan?
  (lambda (a1 a2)
    (cond
      ((and (number? a1) (number? a2))
       (= a1 a2))
      ((or (number? a1) (number? a2)) #f)
      (else (eq? a1 a2)))))


(define occur
  (lambda (a lat)
    (cond
      ((null? lat) 0)
      (else
        (cond
          ((eq? (car lat) a)
           (add1 (occur a (cdr lat))))
          (else (occur a (cdr lat))))))))

(occur 'a '(a b a c d a))

(define one?
  (lambda (n)
    (cond
      ((zero? n) #f)
      (else (zero? (sub1 n))))))

(define rempick
  (lambda (n lat)
    (cond
      ((one? n) (cdr lat))
      (else (cons (car lat)
                  (rempick (sub1 n)
                           (cdr lat)))))))
