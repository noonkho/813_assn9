(define (problem math_5) (:domain simple_math)
; (:objects 
; )

(:init
    (current_num num0)
    (goal num2)
    ; Ground truths
    ; addition
    (add num0 num1 num1) (add num1 num1 num2) (add num2 num1 num3) (add num3 num1 num4) (add num4 num1 num5) 
    (add num0 num2 num2) (add num1 num2 num3) (add num2 num2 num4) (add num3 num2 num5) 
    (add num0 num3 num3) (add num1 num3 num4) (add num2 num3 num5)

    ; subtraction
    (sub num5 num1 num4) (sub num4 num1 num3) (sub num3 num1 num2) (sub num2 num1 num1) (sub num1 num1 num0) 
    (sub num5 num2 num3) (sub num4 num2 num2) (sub num3 num2 num1) (sub num2 num2 num0) 
    (sub num5 num3 num2) (sub num4 num3 num1) (sub num3 num3 num0) 

    ; multiple
    (mul num0 num2 num0) (mul num1 num2 num2) (mul num2 num2 num4) 
    (mul num0 num3 num0) (mul num1 num3 num3) 

    ; lesser than
    (lesser num0 num5) (lesser num1 num5) (lesser num2 num5) (lesser num3 num5) (lesser num4 num5) 
    (lesser num0 num4) (lesser num1 num4) (lesser num2 num4) (lesser num3 num4) 
    (lesser num0 num3) (lesser num1 num3) (lesser num2 num3) 
    (lesser num0 num2) (lesser num1 num2) 
    (lesser num0 num1) 

    ; greater than
    (greater num1 num0) (greater num2 num0) (greater num3 num0) (greater num4 num0) (greater num5 num0) 
    (greater num2 num1) (greater num3 num1) (greater num4 num1) (greater num5 num1) 
    (greater num3 num2) (greater num4 num2) (greater num5 num2) 
    (greater num4 num3) (greater num5 num3) 
    (greater num5 num4) 
)

(:goal (and
    (done)
))

(:metric minimize
        (total-cost)
)
)
