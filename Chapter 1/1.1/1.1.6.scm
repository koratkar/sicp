;Exercises for Chapter 1.1.6 (uncorrected)

;Exercise 1.1 Page 26
  ;10
  ;12
  ;8
  ;3
  ;6
  ;a (correction sort of: Value: a)
  ;b
  ;19
  ;#f
  ;4
  ;16
  ;6
  ;16



;Exercise 1.2 Page 27
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
   ;the answer is -37/150 according to the REPL

;Exercise 1.3 page 27
(define (add-squares x y)
  (+ (* x x) (* y y)))
(define (3arg x y z)
  (cond ((and (> x y) (> z y))
	 (add-squares x z))
	((and (> y z) (> x z))
	 (add-squares x y))
	((and (> y x) (> z x))
	 (add-squares y z))))


;Exercise 1.4 Page 27
(define (a-plus-abs-b a b)
  ((if (> b 0)
        +
        -) a b))
  ;the procedure a-plus-abs-b takes a and b
  ; if b is greater than 0 the if expression evaluates to plus
  ; if b is less, the if expression evaluates to minus
  ; the operand is then applied on a and b
  ; quite clever this one is.



;Exercise 1.5 Page 27
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))

(test 0 (p))
  ;Applicative order evaluation will give ben this:
    ;lol jokes on you, it never gives ben anything because:
    ;normal order evaluation evaluates the arguments then applies.
    ;Because p evaluates to run p, it will just keep going in a recursive spiral.
  ;Normal order evaluation will give ben this:
    ; 0
    ; this is because normal order evaluation evaluates the procedure then applies.
    ; It fully expands until all living things are primitives then applies.
    ; So it evaluates the if statement's predicate (= x 0) right out of the gate and boom!
    ; it evaluates to true
    ; then the scheme interpreter returns 0.
