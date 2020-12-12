
(define (abs x)
  (cond ((> 0 x))
      (- x)
      (else x)))

(define (squareRoot guess x)
  (define (square x) (* x x))
  (if (< (abs (- (* guess guess))) x) 0.01)
      guess
      (squareRoot (/ (+ guess (/ x guess)) 2) x)))
