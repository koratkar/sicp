;Exercises for Chapter 1.2 (incomplete)

;Exercise 1.9 Page 46
  ; First process
  ; (+ 4 5)
  ; (+ 3 6)
  ; (+ 2 7)
  ; (+ 1 8)
  ; (+ 0 9)
  ; 9

  ; Second Process
  ; (+ 4 5)
  ; (+ 3 6)
  ; (+ 2 7)
  ; (+ 1 8)
  ; (+ 0 9)
  ; 9
; The processes are iterative, because they do not expand in what they have to do, and
; because you can restart at any moment

;Exercise 1.10 Page 47
  ; What are the values of the following expressions
    ; Just entered them into the interpreter.
    ; (A 1 10)
    ; 1024
    ; (A 2 4)
    ; 65536
    ; (A 3 3)
    ; 65536
  ; What do the following functions compute?
    ; procedure f computes 2n
    ; procedure g computes 2^n
    ; procedure h computes Ack(2, n)
    ; procedure k computes 5n^2

;Exercise 1.11 Page 53
  ; recursive and iterative processes
  ; f(n−1)+2f(n−2)+3f(n−3) if n≥3.
  ; recursive
   (define (f n)
      (if (< n 3) n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))
  ; Iterative
    ; This one was pretty hard, so after a while I looked at an answer.
    ; (I set a "struggle timer" and I had the completely wrong approach)
  (define (f n)
    (if (< n 3) n
        (f-iter 2 1 0 n)))
  (define (f-iter a b c count)
    (if (< count 3) a
      (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
      ; it works because we give a it just repeats the function from the first starting point:
      ; 2 1 0; which all evaluate to 2 1 0
      ; Throw this in the function, it returns 4 2 1 (+ 4 4 3)
      ; 11 4 2 (+ 11 8 6)
      ; 25 11 4 (+ 25 22 12)
      ; All these have a count appended to them. When the count ticks below 3–for 5 (f-iter 25 11 4 2)—,
      ; we know a is the correct answer, because the original equation needs n to be less than 3.
      ; So when n is 2 in our iterative program, it means that we have ran the program far enough, and
      ; are done!


;Exercise 1.12 Page 53
  ; Every level of Pascal's Triangle is 11^level
  ; This one was hard enough to make me stop for like a month on
  ; SICP. I finally asked my cousin, and learned about the 11 thing
  (define (pasc n)
    (define (p n e)
      (cond ((= e 0) 1)
            ((= e 1) n)
            (else (p (* n 11) (- e 1)))))
        (p 11 n))

        ; While this computes powers of 11, it stops
        ; "working" at row 5.
        ; Also I was wrong, the book wants us to compute a number,
        ; given a row and collumn

        ; After a while I gave up and looked up an answer:
      (define (pasc row col)
        (cond ((or (= row col) (= row 1)) 1)
              ((or (< col 0) (< row 0)) 0)
            (else (+ (pasc (- row 1) (- col 1)) (pasc (- row 1) col)))))
        ; it infact, does not work
        ; (pasc 3 1) returns 1, when it is 3
        ; (pascal 3 2) returns 2, when there are no 2s on the 3rd level (1 3 3 1)
        ; So I wrote a better one:
        ; It uses the algorithm n choose k. But it's not recursvive.
        ; n choose k works on pascal's triangle because
      (define (pasc row col)
        (define (f n)
          (define (fa product count)
             (if (> count n) product
                 (fa (* product count) (+ 1 count))))
            (fa 1 1))
          (/ (f row)
             (* (f col) (f (- row col)))))

;Exercise 1.13 Page 54 λ
  ; Proove that (fib n) is the closest to φ^n/√5
  ; Use inductive reasoning, said the book
  ; so with inductive reasoning, you use a through a number through
  ; what you are trying to proove (k) and then try (+ 1 k)
  ; If it's right, you call it a day and go home
  ; So let's try that
  ; k = 8
  ; fib(8) = 21
  ; φ^8/√5 = 21.009519494257027
  ; Let's try k = 9
  ; fib(9) = 34
  ; φ^8/√5 = 33.99
  ; Cool, it works!

;Exercise 1.14 Page 56
        (cc 5 5)
            |
  +----------------------------+
  (cc 5 4)              (cc -45 5) = 0
    |----------------|
    +                +
  (cc 5 3)       (cc -25 5) = 0
    |
    |---------------|
    +               +
  (cc 5 2)        (cc -10 5) = 0
    |
  +------------+
  (cc 5 1)     (cc 0 5) = 1
    |
    |
    |
    +---------------+
  (cc 5 0) = 0     (cc 4 1)
                      |
                      +-----------------+
                      (cc 4 0) = 0     (cc 3 1)
                                        |
                                        +-------------------+
                                        (cc 3 0) = 0        (cc 2 1)
                                                              |
                                                              1
        (cc 5 5) => 2

  ; The orders of growth means that this won't increase linearly.
  ; I think.
  ; It should be exponential.

;Exercise 1.15 Page 56
  ; Following SICP code:
  (define (cube x) (* x x x))
  (define (p x) (- (* 3 x) (* 4 (cube x))))
  (define (sine angle)
    (if (not (> (abs angle) 0.1))
     angle
      (p (sine (/ angle 3.0))))))
  ; a. when (sine 12.5) is evaluated, how many times does p run?
    ; Correction, the angle was 12.15, and it runs 5 times, but I got the write answer,
    ; at least in terms of code.
    ; P runs 5 times
    ; Was I supposed to write this out by hand?
    ; Well, I use the begin macro, so well :0
    ; This is my code:
    (define (sine angle)
      (if (not (> (abs angle) 0.1))
       angle
       (begin (p (sine (/ angle 3.0))))))
    ; 1 ]=> (sine 12.5)
    ; I ran your p function
    ; I ran your p function
    ; I ran your p function
    ; I ran your p function
    ; I ran your p function
    ; Value: -6.0813768577286265e-2

  ; b. What is the order of growth in space and number of steps
  ; (as a function of a) used by the process generated by
  ; the sine procedure when (sine a) is evaluated?
    ; I'm not sure how to do this problem; so here is my best try.
    ; f(a) = AAAAAAH
    ; Yeah, i just googled a solution because I knew I wouldn't get the answer.
    ; We shall see in the future, where I get, and what I find out!
    ; So now I know a little more about Big O notation and Time complexity.
    ; Here is my attempt:
    ; (sine) is 0(n^2)

; 1.16
; 1.17
; 1.18
; 1.19
; 1.20
; 1.21
; 1.22
; 1.23
; 1.24
; 1.25
; 1.26
; 1.27
; 1.28
