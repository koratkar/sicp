; Exercise ? Page ? BY Meeeeeee
; write a procedure that calculates exponents
(define (pow n e)
  (define (p n e original)
    (cond ((= e 1) n)
          ((= e 0) 1)
      (else (p (* n original) (- e 1) original))))
    (p n e n))
