(define (problem math_5) (:domain simple_math)
; (:objects 
; )

(:init
    (current_num num0)
    (goal num5)
    ; Ground truths
    ; addition
    (add num0 num1 num1) (add num1 num1 num2) (add num2 num1 num3) (add num3 num1 num4) (add num4 num1 num5) (add num5 num1 num6) (add num6 num1 num7) (add num7 num1 num8) (add num8 num1 num9) (add num9 num1 num10) 
    (add num0 num2 num2) (add num1 num2 num3) (add num2 num2 num4) (add num3 num2 num5) (add num4 num2 num6) (add num5 num2 num7) (add num6 num2 num8) (add num7 num2 num9) (add num8 num2 num10) 
    (add num0 num3 num3) (add num1 num3 num4) (add num2 num3 num5) (add num3 num3 num6) (add num4 num3 num7) (add num5 num3 num8) (add num6 num3 num9) (add num7 num3 num10) 

    ; subtraction
    (sub num10 num1 num9) (sub num9 num1 num8) (sub num8 num1 num7) (sub num7 num1 num6) (sub num6 num1 num5) (sub num5 num1 num4) (sub num4 num1 num3) (sub num3 num1 num2) (sub num2 num1 num1) (sub num1 num1 num0) 
    (sub num10 num2 num8) (sub num9 num2 num7) (sub num8 num2 num6) (sub num7 num2 num5) (sub num6 num2 num4) (sub num5 num2 num3) (sub num4 num2 num2) (sub num3 num2 num1) (sub num2 num2 num0) 
    (sub num10 num3 num7) (sub num9 num3 num6) (sub num8 num3 num5) (sub num7 num3 num4) (sub num6 num3 num3) (sub num5 num3 num2) (sub num4 num3 num1) (sub num3 num3 num0) 

    ; multiple
    (mul num0 num2 num0) (mul num1 num2 num2) (mul num2 num2 num4) (mul num3 num2 num6) (mul num4 num2 num8) (mul num5 num2 num10) 
    (mul num0 num3 num0) (mul num1 num3 num3) (mul num2 num3 num6) (mul num3 num3 num9) 

    ; lesser than
    (lesser num0 num10) (lesser num1 num10) (lesser num2 num10) (lesser num3 num10) (lesser num4 num10) (lesser num5 num10) (lesser num6 num10) (lesser num7 num10) (lesser num8 num10) (lesser num9 num10) 
    (lesser num0 num9) (lesser num1 num9) (lesser num2 num9) (lesser num3 num9) (lesser num4 num9) (lesser num5 num9) (lesser num6 num9) (lesser num7 num9) (lesser num8 num9) 
    (lesser num0 num8) (lesser num1 num8) (lesser num2 num8) (lesser num3 num8) (lesser num4 num8) (lesser num5 num8) (lesser num6 num8) (lesser num7 num8) 
    (lesser num0 num7) (lesser num1 num7) (lesser num2 num7) (lesser num3 num7) (lesser num4 num7) (lesser num5 num7) (lesser num6 num7) 
    (lesser num0 num6) (lesser num1 num6) (lesser num2 num6) (lesser num3 num6) (lesser num4 num6) (lesser num5 num6) 
    (lesser num0 num5) (lesser num1 num5) (lesser num2 num5) (lesser num3 num5) (lesser num4 num5) 
    (lesser num0 num4) (lesser num1 num4) (lesser num2 num4) (lesser num3 num4) 
    (lesser num0 num3) (lesser num1 num3) (lesser num2 num3) 
    (lesser num0 num2) (lesser num1 num2) 
    (lesser num0 num1) 

    ; greater than
    (greater num1 num0) (greater num2 num0) (greater num3 num0) (greater num4 num0) (greater num5 num0) (greater num6 num0) (greater num7 num0) (greater num8 num0) (greater num9 num0) (greater num10 num0) 
    (greater num2 num1) (greater num3 num1) (greater num4 num1) (greater num5 num1) (greater num6 num1) (greater num7 num1) (greater num8 num1) (greater num9 num1) (greater num10 num1) 
    (greater num3 num2) (greater num4 num2) (greater num5 num2) (greater num6 num2) (greater num7 num2) (greater num8 num2) (greater num9 num2) (greater num10 num2) 
    (greater num4 num3) (greater num5 num3) (greater num6 num3) (greater num7 num3) (greater num8 num3) (greater num9 num3) (greater num10 num3) 
    (greater num5 num4) (greater num6 num4) (greater num7 num4) (greater num8 num4) (greater num9 num4) (greater num10 num4) 
    (greater num6 num5) (greater num7 num5) (greater num8 num5) (greater num9 num5) (greater num10 num5) 
    (greater num7 num6) (greater num8 num6) (greater num9 num6) (greater num10 num6) 
    (greater num8 num7) (greater num9 num7) (greater num10 num7) 
    (greater num9 num8) (greater num10 num8) 
    (greater num10 num9) 
)

(:goal (and
    (done)
))

(:metric minimize
        (total-cost)
)
)
