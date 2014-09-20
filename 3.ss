#lang scheme

(define rember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((eq? (car lat) a) (cdr lat))
              (else (cons (car lat)
                          (rember a
                                  (cdr lat)))))))))

(rember 'mint '(lamb chops and mint jelly)) ; (lamb chops and jelly)
(rember 'mint '(lamb chops and mint flavored mint jelly)) ; (lamb chops and flavored mint jelly)
(rember 'toast '(bacon lettuce and tomato)) ; (bacon lettuce and tomato)
(rember 'cup '(coffee cup tea cup and hick cup)) ; (coffee tea cup and hick cup)

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
; |                       THE SECOND COMMANDMENT                       |
; ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; Use cons to build lists.

; (define rember
;   (lambda (a lat)
;     (cond
;       ((null? lat) '())
;       ((eq? (car lat) a) (cdr lat))
;       (else (cons (car lat)
;                   (rember a (cdr lat)))))))
(rember 'sauce '(soy sauce and tomato sauce))

; #||||||||||||
;  |  firsts  |
;  ||||||||||||#

(define firsts
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons (car (car l)) (firsts (cdr l)))))))

(define seconds
  (lambda (l)
    (cond
      ((null? l) '())
      (else (cons (car (cdr (car l))) (seconds (cdr l)))))))

(firsts '((apple peach pumpkin)
         (plum pear cherry)
         (grape raisin pea)
         (bean carrot eggplant))) ; (apple plum grape bean)
(firsts '((a b) (c d) (e f))) ; (a c e)
(firsts '()) ; ()
(firsts '(((five plums) (four)) (eleven green oranges))) ; ((five plums) eleven)
(firsts '(((five plums) four)
        (eleven green oranges)
        ((no) more))) ; ((five plums) eleven (no))

(seconds '((a b) (c d) (e f))) ; (b d f)

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                       THE THIRD COMMANDMENT                        |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; When building a list, describe the first typical element, and then cons it
; onto the natural recursion.

(define insertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old)
           (cons old
                 (cons new (cdr lat))))
          (else (cons (car lat)
                      (insertR new old
                               (cdr lat)))))))))

(insertR 'topping 'fudge
         '(ice cream with fudge for dessert)
         ) ; (ice cream with fudge topping for dessert)
(insertR 'jalapeno 'and
         '(tacos tamales and salsa)
         ) ; (tacos tamales and jalapeno salsa)
(insertR 'e 'd
         '(a b c d f g d h)
         ) ; (a b c d e f g d h)

(define insertL
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((eq? (car lat) old)
               (cons new
                     (cons old (cdr lat))))
              (else (cons (car lat)
                          (insertL new old
                                   (cdr lat)))))))))

(define subst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((eq? (car lat) old)
               (cons new (cdr lat)))
              (else (cons (car lat)
                          (subst new old
                                 (cdr lat)))))))))

(define subst2
  (lambda (new o1 o2 lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((or (eq? (car lat) o1) (eq? (car lat) o2))
               (cons new (cdr lat)))
              (else (cons (car lat)
                          (subst2 new o1 o2
                                  (cdr lat)))))))))

(subst2 'a 'b 'c '(c))

(define multirember
  (lambda (a lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) a)
           (multirember a (cdr lat)))
          (else (cons (car lat)
                      (multirember a
                                   (cdr lat)))))))))

(multirember 'a '(a b a c a d a e))

(define multiinsertR
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else
        (cond
          ((eq? (car lat) old)
                (cons new
                      (cons old (multiinsertR new old
                                              (cdr lat)))))
          (else
            (cons (car lat)
                  (multiinsertR new old
                                (cdr lat)))))))))

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                       THE FOURTH COMMANDMENT                       |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; Always change at least one argument while recurring. It must be changed
; to be closer to termination. The changing argument must be tested in
; the termination condition: when using cdr, test termination with null?.

(define multisubst
  (lambda (new old lat)
    (cond
      ((null? lat) '())
      (else (cond
              ((eq? (car lat) old)
               (cons new )))))))
