;Exercises for Chapter 1.1 (corrected)
; y is correct n is incorrect
; No total score. The point is to learn, if I didn't get something, I'll change my approach
; to get it. Understanding is the point, not gratification.

;Exercise 1.1 Page 26
  ;10 y
  ;12 y
  ;8 y
  ;3 y
  ;6 y
  ;a (correction sort of: Value: a) sort of n
  ;b (correction: Value: b) sort of n
  ;19 y
  ;#f y
  ;4 y
  ;16 y
  ;6 y
  ;16 y

;Exercise 1.2 Page 27
; y
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3 (- 6 2) (- 2 7)))
   ;the answer is -37/150 according to the REPL also y

;Exercise 1.3 page 27
; y
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
; y
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
; y
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

;Exercise 1.6 Page 32
; y comment: yes! I was right! Alyssa P. Hacker's code is stuck in an infinte loop
  ; I don't think Alyssa P. Hacker's code returns because her code
  ; evaluates with applicative order evaluation. The expressions will keep getting evaluated.

;Exercise 1.7 Page 33
; y comment: It does the job in the scheme interpreter. And it hit the objective.
; It just looks different than the instruction books code.
  ;Objective: to write a better "good-enough?" procedure. "Watch how guess changes and make it stop
  ; when the change is a very small fraction"
  ; SICP provided square root code:
(define (square x)
  (* x x))
(define (abs x)
  (if (> 0 x)
    (- x)
    x))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)))
(define (sqrt x)
  (sqrt-iter 1.0 x))

    ; My modified sqrt-iter and good-enough?
(define (better-sqrt-iter guess x prev-guess)
  (if (better-good-enough? guess prev-guess)
        guess
        (better-sqrt-iter (improve guess x) x guess)))
(define (better-good-enough? guess prev-guess)
  (< (abs (- prev-guess guess)) 0.001))
(define (better-sqrt x)
  (better-sqrt-iter 1.0 x 0))
; So my code was close, It was running wrong because of a small error, if it works
; now I'll give myself full credit.
; Alright, it works now. I'll give myself full credit for this problem.
; I'm reading a solution book while grading, and my "better-good-enough?" could be improved.
; ....
; Ignore the irony.

;Exercise 1.8 Page 33
; y
; Comment: I tried to make it work just like 1.7 but no.
; below this I rewrote some of it to follow the paradigm.
  ; Get the cube-root
  ; Assuming we have the same functions as from 1.7
(define (cbrt-improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (cube x)
  (* x x x))
(define (good-enough-cbrt? guess x)
  (< (abs (- (cube guess) x)) 0.001))
(define (cbrt-iter guess x)
  (if (good-enough-cbrt? guess x)
    guess
    (cbrt-iter (cbrt-improve guess x) x)))
(define (cbrt x)
  (cbrt-iter 1.0 x))

; Make it work according to 1.7
(define (cbrt-improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
(define (cube x)
  (* x x x))
(define (good-enough-cbrt? guess x previous-guess)
  (< (abs (/ (- previous-guess guess) guess)) 0.001))
(define (cbrt-iter guess x prev-gues)
  (if (good-enough-cbrt? guess x prev-guess)
    guess
    (cbrt-iter (cbrt-improve guess x) x guess)))
(define (cbrt x)
  (cbrt-iter 1.0 x 1.0))
