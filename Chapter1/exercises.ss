This is the Scheme process buffer.
Type C-x C-e to evaluate the expression before point.
Type C-c C-c to abort evaluation.
Type C-h m for more information.

MIT/GNU Scheme running under MacOSX

Copyright (C) 2011 Massachusetts Institute of Technology
This is free software; see the source for copying conditions. There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

Image saved on Tuesday November 8, 2011 at 10:45:46 PM
  Release 9.1.1     || Microcode 15.3 || Runtime 15.7 || SF 4.41
  LIAR/x86-64 4.118 || Edwin 3.116

(+ 21 35 12 7)
;Value: 75

;Value: 75

(* 25 4 12)
;Value: 1200

(+ (* 3 5) (- 10 6))
;Value: 19

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))
;Value: 57

(define size 2)
;Value: size

size
;Value: 2

(* 5 size)
;Value: 10

(define pi 3.14159)
;Value: pi

(define radius 10)
;Value: radius

(* pi (* radius radius))
;Value: 314.159

(define circumference (* 2 pi radius))
circumference

;Unbound variable: circumference
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of circumference.
; (RESTART 2) => Define circumference to a given value.
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 2)

(define circumference (* 2 pi radius))
;Value: circumference

circumference
;Value: circumference

(* (+ 2 (* 4 6))
   (+ 3 5 7))
;Value: 390

(define (square x) (* x x))
;Value: square

square 5
;Value: 5

(square 5)
;Value: 25

(square 21)
;Value: 441

(square (+ 2 5))
;Value: 49

(square (square 3))
;Value: 81

(define (sum-of-squares x y)
  (+ (square x) (square y)))
;Value: sum-of-squares

(sum-of-squares 3 4)
;Value: 25

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
;Value: f

(f 5)
;Value: 136

(define (abs x)
  (cond ((> x 0) x)
	((= x 0) 0)
	((< x 0) (- x))))
;Value: abs

(define (abs x)
  (cond ((< x 0) (- x))
	(else x)))
;Value: abs

(define (abs x)
  (if (< x 0)
      (- x)
      x))
;Value: abs

(and (> x 5) (< x 10))

;Unbound variable: x
;To continue, call RESTART with an option number:
; (RESTART 3) => Specify a value to use instead of x.
; (RESTART 2) => Define x to a given value.
; (RESTART 1) => Return to read-eval-print level 1.

(RESTART 3)

(RESTART 3)

(define (>= x y)
  (or (> x y) (= x y)))
;Value: >=

(define (>= x y)
  (not (< x y)))
;Value: >=

10
;Value: 10

(+ 5 3 4)
;Value: 12

(- 9 1)
;Value: 8

(/ 6 2)
;Value: 3

(+ (* 2 4) (- 4 6))
;Value: 6

(define a 3)
;Value: a

(define b (+ a 1))
;Value: b

(+ a b (* a b))
;Value: 19

(= a b)
;Value: #f

(if (and (> b a) (< b (* a b)))
    b
    a)
;Value: 4

(* (cond ((= a 4) 6)
	 ((= b 4) (+ 6 7 a))
	 (else -1))
   (+ a 1))
;Value: 64

(/ (+ 5 (+ 4 (- 2 (- 3 (+ 6 (/ 4 5)))))) (* 3 (* (- 6 2) (- 2 7))))
;Value: -37/150

(define (sum-two-largest-squares x y z) 
   (if (> x y)
	(if (> y z)
	    (+ (* x x) (* y y))
	    (+ (* x x) (* z z)))
	(if (> x z)
	    (+ (* x x) (* y y))
	    (+ (* y y) (* z z)))))
;Value: sum-two-largest-squares

(sum-two-largest-squares 10 9 8)
;Value: 181

(sum-two-largest-squares 10 8 9)
;Value: 181

(sum-two-largest-squares 8 9 10)
;Value: 181

(define (max x y)
  (if (> x y) x y))
;Value: max

(define (min x y)
  (if (< x y) x y))
;Value: min

(define (square x) (* x x))
;Value: square

(define (sum-of-squares x y)
  (+ (square x) (square y)))
;Value: sum-of-squares

(define (sum-two-largest-squares x y z)
  (sum-of-squares (max x y) (max z (min x y))))
;Value: sum-two-largest-squares

(sum-two-largest-squares 8 9 10)
;Value: 181

(sum-two-largest-squares 9 8 10)
;Value: 181

(sum-two-largest-squares 10 8 9)
;Value: 181

;((if (> b 0) + -) a b) will pick an operator depending on whether b > 0 then apply it to the proceeding a b

(define (p) (p))
;Value: p

(define (test x y)
  (if (= x 0)
      0
      y))
;Value: test

;Ben should see an infinite loop if the interpreter is using applicative order evaluation as it tries to recursively evaluate (p) when it's passed to the test method, if it's using normal order then it should evaluate to 0 since it won't need to evaluate (p)

(test 0 (p))

;Quit!

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
;Value: good-enough?

(define (average x y)
  (/ (+ x y) 2))
;Value: average

(define (improve guess x)
  (average guess (/ x guess)))
;Value: improve

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) 
		 x)))
;Value: sqrt-iter

(define (sqrt x)
  (sqrt-iter 1.0 x))
;Value: sqrt

(sqrt 9)
;Value: 3.00009155413138

(sqrt (+ 100 37))
;Value: 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
;Value: 1.7739279023207892

(square (sqrt 1000))
;Value: 1000.000369924366

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))
;Value: new-if

(new-if (= 2 3) 0 5)
;Value: 5

(new-if (= 1 1) 0 5)
;Value: 0

;Since the new-if is a function and the scheme interpreter uses applicative evaluation it will evaluate all the arguments. This means that sqrt-iter infinitely recurses so the new-if will never return a value

;Results for small values become very inaccurate. For example if we take a number smaller than the threshold then we can expect it to be out by an enormous factor:

(sqrt 0.000001)
;Value: 3.1260655525445276e-2

;The above example is out by a factor of around 30. For large numbers the threshold becomes too small, since the function will endlessly alternate between guesses that are more than the threshold away from the true square root.

(sqrt 1e10)
;Value: 100000.

(sqrt 1e100)

;Quit!

;The above falls into an infinite recurse on my x64 machine with MIT/GNU scheme


(define (good-enough? guess prev-guess)
  (< (/ (abs (- guess prev-guess))
	guess)
     0.001))
;Value: good-enough?

(define (sqrt-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (sqrt-iter (improve guess x)
		 guess
		 x)))
;Value: sqrt-iter

(define (sqrt x)
  (sqrt-iter 1.0 0.0 x))
;Value: sqrt

(sqrt 1e100)
;Value: 1.0000000000002003e50

(sqrt 0.000001)
;Value: 1.0000001533016628e-3

(define (square x) (* x x))
;Value: square

(define (good-enough? guess prev-guess)
  (< (/ (abs (- guess prev-guess))
	guess)
     0.001))
;Value: good-enough?

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))
;Value: improve

(define (cubert-iter guess prev-guess x)
  (if (good-enough? guess prev-guess)
      guess
      (cubert-iter (improve guess x)
		   guess
		   x)))
;Value: cubert-iter

(define (cubert x)
  (cubert-iter 1.0 0.0 x))
;Value: cubert

(cubert 8)
;Value: 2.000000000012062

(define (average x y)
  (/ (+ x y) 2))
;Value: average

(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
	guess
	(sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))
;Value: sqrt

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
	guess
	(sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
;Value: sqrt

(sqrt 4)
;Value: 2.0000000929222947

(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))
;Value: factorial

(factorial 6)
;Value: 720

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
		 (+ counter 1)
		 max-count)))
;Value: fact-iter

(define (factorial n)
  (fact-iter 1 1 n))
;Value: factorial

(factorial 6)
;Value: 720

; The expansion of (+ a b) as described in 1.9 will proceed as follows
; (+ 3 5) ;; a, 3 here, is not equal to 0 so it begins recursing
; (inc (+ 2 5))
; (inc (inc ( + 1 5)))
; (inc (inc (inc (+ 0 5)))) ;; at this point a == 0 so contraction can begin
; (inc (inc 6))
; (inc 7)
; 8
; This process is recursive

; For the second form provided the expansion proceeds as follows
; (+ 3 5)
; (+ 2 6) ;; decrement a, increment b
; (+ 1 7)
; (+ 0 8)
; 8
; This process is iterative

(define (Ackermans x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (Ackermans (- x 1)
			 (Ackermans x (- y 1))))))
;Value: ackermans

; For (Ackermans 1 10) the expansion is as follows
; (Ackermans 1 10) ; doesn't match any end conditions, falls into the else block
; (Ackermans 0 (Ackermans 1 9)) ; evaluates the second call first, so it won't hit the condition where x == 0
; (Ackermans 0 (Ackermans 0 (Ackermans 1 8)))
; (Ackermans 0 (Ackermans 0 (Ackermans 0 (Ackermans 1 7))))
; (Ackermans 0 (Ackermans 0 (Ackermans 0 (Ackermans 0 (Ackermans 1 6)))))
; ...
; (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (* 2 (2))))))))))
; As you can see this function raises 2^10 in this case

(Ackermans 1 10)
;Value: 1024

; In the second instance the expansion will follow:
; (Ackermans 2 4) ;; no end conditions met
; (Ackermans 1 (Ackermans 2 3))
; (Ackermans 1 (Ackermans 1 (Ackermans 2 2)))
; (Ackermans 1 (Ackermans 1 (Ackermans 1 (Ackermans 2 1)))) ;;some contraction begins here as y == 1 triggers an end condition
; (Ackermans 1 (Ackermans 1 (Ackermans 1 2))) ;; expansion starts again
; (Ackermans 1 (Ackermans 1 (Ackermans 0 (Ackermans 1 1))))
; (Ackermans 1 (Ackermans 1 (Ackermans 0 2)
; (Ackermans 1 (Ackermans 1 4))
; (Ackermans 1 (Ackermans 0 (Ackermans 1 3)))
; (Ackermans 1 (Ackermans 0 (Ackermans 0 (Ackermans 1 2))))
; (Ackermans 1 (Ackermans 0 (Ackermans 0 (Ackermans 0 (Ackermans 1 1)))))
; (Ackermans 1 (Ackermans 0 (Ackermans 0 (Ackermans 0 2))))
; (Ackermans 1 (* 2 (* 2 (* 2 2))))
; (Ackermans 1 16)
; ...
; 2^16

(Ackermans 2 4)
;Value: 65536

; This one's a bit hairy to manually expand so lets just let emacs do it for me
(Ackermans 3 3)
;Value: 65536

(Ackermans 3 2)
;Value: 4

(Ackermans 3 1)
;Value: 2

(define (f n) (Ackermans 0 n))
;Value: f

(f 0)
;Value: 0

(f 1)
;Value: 2

(f 2)
;Value: 4

; (f n) == 2n

(define (g n) (Ackermans 1 n))
;Value: g

(g 0)
;Value: 0

(g 1)
;Value: 2

(g 2)
;Value: 4

(g 3)
;Value: 8

; (g n) as seen above will be 2^n, except in the case of 0 where it will be 0

(define (h n) (Ackermans 2 n))
;Value: h

(h 0)
;Value: 0

(h 1)
;Value: 2

(h 2)
;Value: 4

(h 3)
;Value: 16

(h 4)
;Value: 65536

; (h n) == 2 ^ (h(n-1)), (h 1) = 2, (h 0) = 0
