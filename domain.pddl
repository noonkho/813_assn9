;Header and description

(define (domain mathsss)

(:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

(:types
    number variable
)

(:constants
    num0 num1 num2 num3 num4 num5 num6 num7 num8 num9 num10 - number
    x y - variable
)

(:functions
    (total-cost)
)

(:predicates
    (current_num ?var - variable ?n - number)
    (add ?n1 ?n2 ?r - number)
    (sub ?n1 ?n2 ?r - number)
    (mul ?n1 ?n2 ?r - number)
    (greater ?n1 ?n2 - number)
    (lesser ?n1 ?n2 - number)
    (goal ?var - variable ?n - number)
    (solved)

    (sub_count ?n - number)
    (succ ?n1 ?n2 - number)

    (connect ?v1 ?v2 - variable)
)


(:action add_oneof
    :parameters (?var - variable ?n ?goal ?r1 ?r2 ?r3 - number ?v2 - variable ?v2_curr ?v2_r - number)
    :precondition (and 
        (current_num ?var ?n)
        (goal ?var ?goal)
        (lesser ?n ?goal)

        (add ?n num1 ?r1)
        (add ?n num2 ?r2)
        (add ?n num3 ?r3)

        (connect ?var ?v2)
        (current_num ?v2 ?v2_curr)
        (add ?v2_curr num1 ?v2_r)
    )
    :effect (and
        (not (current_num ?var ?n))
        (oneof
            (current_num ?var ?r1)
            (current_num ?var ?r2)
            (current_num ?var ?r3)
        )

        (not (current_num ?v2 ?v2_curr))
        (current_num ?v2 ?v2_r)

        (increase (total-cost) 10)
    )
)

(:action multiple_oneof
    :parameters (?var - variable ?n ?goal ?r1 ?r2 - number ?v2 - variable ?v2_curr ?v2_r - number)
    :precondition (and 
        (current_num ?var ?n)
        (goal ?var ?goal)
        (lesser ?n ?goal)

        (mul ?n num2 ?r1)
        (mul ?n num3 ?r2)

        (connect ?var ?v2)
        (current_num ?v2 ?v2_curr)
        (mul ?v2_curr num2 ?v2_r)
    )
    :effect (and 
        (not (current_num ?var ?n))
        (oneof
            (current_num ?var ?r1)
            (current_num ?var ?r2)
        )

        (not (current_num ?v2 ?v2_curr))
        (current_num ?v2 ?v2_r)

        (increase (total-cost) 1)
    )
)

(:action substract_one
    :parameters (?var - variable ?n ?goal ?r ?count1 ?count2 - number)
    ; :parameters (?var - variable ?n ?goal ?r - number)
    :precondition (and 
        (current_num ?var ?n)
        (goal ?var ?goal)
        (greater ?n ?goal)
    
        (sub ?n num1 ?r)

        (sub_count ?count1)
        (succ ?count1 ?count2) ; maximum number of subtract is 5 since in the problem.pddl, it only goes to (succ num4 num5)
    )
    :effect (and 
        (not (current_num ?var ?n))
        (current_num ?var ?r)

        (increase (total-cost) 5)

        (not (sub_count ?count1))
        (sub_count ?count2) 
    )
)


(:action done
    ; :parameters (?num1 ?num2 - number)
    :parameters ()
    :precondition (and 
        (forall (?var - variable)
            (forall (?num - number) 
                (imply (goal ?var ?num)
                    (current_num ?var ?num)
                )
            )
        )

        ; (forall (?var - variable ?num - number)
        ;     (imply (goal ?var ?num)
        ;         (current_num ?var ?num)
        ;     )
        ; )

        ; (current_num x ?num1)
        ; (goal x ?num1)
        ; (current_num y ?num2)
        ; (goal y ?num2)
    )
    :effect (and 
        (solved)
    )
)



)