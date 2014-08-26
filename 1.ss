#lang scheme

(define atom?
  (lambda (x)
    (and (not (pair? x)) (not (null? x)))))

'turkey
'1492
'u
'*abc$
'(atom)
'(atom turkey or)
; (atom turkey) or
'('(atom turkey) or)
'(x y z)
'('(x y) z)
'(how are you doing so far)
'(((how) are) ((you) (doing so)) far)
'(((how) are) ((you) (doing so)) far)
'()
'()
'(() () () ())

(car '(a b c))
(car '((a b c) x y z))
; (car 'hotdog)
; (car '())

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                           THE LAW OF CAR                           |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; The primitve car is defined only for non-empty lists.

(car '(((hotdogs)) (and) (pickle) relish))
(car '(((hotdogs)) (and) (pickle) relish))
(car (car '(((hotdogs)) (and))))


(cdr '(a b c))
(cdr '((a b c) x y z))
(cdr '(hamburger))
(cdr '((x) t r))
; (cdr 'hotdogs)
; (cdr ())

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                           THE LAW OF CDR                           |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; The primitive cdr is defined only for non-empty lists.
; The cdr of any non-empty list is always another list.

(car (cdr '((b) (x y) ((c)))))
(cdr (cdr '((b) (x y) ((c))))) ; (((c)))
; (cdr (car '(a (b (c)) d)))


(cons 'peanut '(butter and jelly))
(cons '(banana and) '(peanut butter and jelly)) ; ((banana and) peanut butter and jelly)
(cons '((help) this) '(is very ((hard) to learn))) ; ((help) this is very ((hard) to learn))
(cons '(a b (c)) '()) ; ((a b (c)))
(cons 'a '())
(car (cons 'a 'b))
(cdr (cons 'a 'b))

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                          THE LAW OF CONS                           |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; The primitve cons takes two arguments.
; The second argument to cons must be a list.
; The result is a list.

(cons 'a '((b) c d)) ; (a (b) c d)
(cons 'a (cdr '((b) c d))) ; (a c d)


(null? '())
(null? (quote ()))
(null? '(a b c))
(null? 'spaghetti)

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                          THE LAW OF NULL?                          |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#

(atom? 'Harry)
(atom? '(Harry had a heap of apples))
(atom? (car '(Harry had a heap of apples)))
(atom? (cdr '(Harry had a heap of apples)))
(atom? (cdr '(Harry)))
(atom? (car (cdr '(swing low sweet cherry oat))))
(atom? (car (cdr '(swing (low sweet) (cherry oat)))))
(eq? 'Harry 'Harry)
(eq? 'margarine 'butter)
(eq? '(asd) '(asd))
(eq? 1 1)

; #||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;  |                           THE LAW OF EQ?                           |
;  ||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||#
; The primitive eq? takes two arguments.
; Each must be a non-numeric atom.
(eq? (car '(Mary had a little lamb chop)) 'Mary) ; #t
(eq? (cdr '(soured milk)) 'milk)
(eq? (car '(beans beans we need jelly beans)) (car (cdr '(beans beans we need jelly beans))))
