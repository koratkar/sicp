;Exercises for Chapter 1.3 (incomplete)

; 1.29 Page 80
; "Define a procedure that takes as arguments f , a, b, and n and returns the value of the integral,
; computed using Simpson’s Rule. Use your procedure to integrate cube between 0 and 1
; (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above."



; 1.30 Page 80 (complete)
  ; assume we have these procedures:
  (define (inc n)
    (+ n 1))
  (define (ret-x x) x)
  ; Rewrite this so it is iterative:
  (define (sum term a next b)
    (if (> a b)
      0
      (+ (term a) (sum term (next a) next b))))

  (define (sum term a next b)
    (define (iter a result)
      (if (> a b)
        result
      (iter (next a) (+ (term a) result))))
    (iter (next a) a))

; 1.31 (complete)

  (define (product term a next b)
    (define (iter a result)
      (if (> a b)
        result
        (iter (next a) (* (term a) result))))
        (iter (next a) a))

  ; Recursive product

    (define (product term a next b)
      (if (> a b)
        0
        (* (terzm a) (product term (next a) next b))))

  ; Factorial using product
  (define (fact n)
    (define (term n)
      (* n (+ n 1)))
    (define (next n)
      (+ n 1))
    (product term 1 next n))

; 1.32


; 1.33


; 1.34 Page 88 (correct!)
    ; Suppose we define the procedure
    (define (f g)
      (g 2))
    ; What happens if (f f)?
  ; It says 2 isn't a function
  ; This is because you are applying
  ; > (f f)
  ; > (f 2)
  ; > (2 2)
  ; > ?? 2 isn't a function

; 1.46
