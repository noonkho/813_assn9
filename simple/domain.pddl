;Header and description

(define (domain simple_math)

;remove requirements that are not needed
; (:requirements :strips :fluents :typing :conditional-effects :negative-preconditions :equality :adl :non-deterministic)
(:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    number
)

(:constants
    num0 num1 num2 num3 num4 num5 num6 num7 num8 num9 num10 - number
)

(:functions
    (total-cost)
)

(:predicates
    (current_num ?n - number)
    (add ?n1 ?n2 ?r - number)
    (sub ?n1 ?n2 ?r - number)
    (mul ?n1 ?n2 ?r - number)
    (greater ?n1 ?n2 - number)
    (lesser ?n1 ?n2 - number)
    (goal ?n - number)
    (done)
)

(:action add_oneof
    :parameters (?n ?r1 ?r2 ?r3 ?goal - number)
    :precondition (and 
        ; (not (addbound ?n))
        (current_num ?n)
        (lesser ?n ?goal)
        (goal ?goal)

        (add ?n num1 ?r1)
        (add ?n num2 ?r2)
        (add ?n num3 ?r3)
    )
    :effect (and
        (not (current_num ?n))
        (oneof
            (current_num ?r1)
            (current_num ?r2)
            (current_num ?r3)
        )
        (increase (total-cost) 10)
    )
)

(:action multiple_oneof
    :parameters (?n ?r1 ?r2 ?goal - number)
    :precondition (and 
        (current_num ?n)
        (lesser ?n ?goal)
        (goal ?goal)

        (mul ?n num2 ?r1)
        (mul ?n num3 ?r2)
    )
    :effect (and 
        (not (current_num ?n))
        (oneof
            (current_num ?r1)
            (current_num ?r2)
        )
        (increase (total-cost) 1)
    )
)

(:action substract_one
    :parameters (?n ?r ?goal - number)
    :precondition (and 
        ; (not (subbound ?n))
        (current_num ?n)
        (greater ?n ?goal)
        (goal ?goal)

        (sub ?n num1 ?r)
    )
    :effect (and 
        (not (current_num ?n))
        (current_num ?r)
        (increase (total-cost) 5)
    )
)



(:action done
    :parameters (?n - number)
    :precondition (and 
        (current_num ?n)
        (goal ?n)
    )
    :effect (and 
        (done)
    )
)



)