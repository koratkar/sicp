; Exercise ? Page ? BY Meeeeeee
; write a procedure that calculates exponents
(define (pow n e)
  (define (p n e original)
    (if (= e 1) n
      (p (* n original) (- e 1) original)))
    (p n e n))
