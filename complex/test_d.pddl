;Header and description

(define (domain math_grid)

;remove requirements that are not needed
(:requirements :action-costs :conditional-effects :negative-preconditions :equality :adl :non-deterministic)

(:types
    number cell
)

(:constants
    num0 num1 num2 num3 num4 num5 num6 num7 num8 num9 num10 - number
)

(:functions
    (total-cost)
)

(:predicates
    (current_num ?c - cell ?n - number)
    (add ?n1 ?n2 ?r - number)
    (sub ?n1 ?n2 ?r - number)
    (mul ?n1 ?n2 ?r - number)
    (greater ?n1 ?n2 - number)
    (lesser ?n1 ?n2 - number)
    (goal ?c - cell ?n - number)
    (solved)

    (sub_count ?n - number)
    (succ ?n1 ?n2 - number)

    (connect ?c1 ?c2 - cell)
)


(:action add_oneof
    :parameters (?c - cell ?n ?goal ?r1 ?r2 ?r3 - number ?ca - cell ?curr_a ?ra - number ?cb - cell ?curr_b ?rb - number ?cc - cell ?curr_c ?rc - number)
    :precondition (and 
        (current_num ?c ?n)
        (goal ?c ?goal)
        (lesser ?n ?goal)

        (add ?n num1 ?r1)
        (add ?n num2 ?r2)
        (add ?n num3 ?r3)

        (connect ?c ?ca)
        (connect ?c ?cb)
        (connect ?c ?cc)
        (current_num ?ca ?curr_a)
        (current_num ?cb ?curr_b)
        (current_num ?cc ?curr_c)
        (add ?curr_a num1 ?ra)
        (add ?curr_b num1 ?rb)
        (add ?curr_c num1 ?rc)
    )
    :effect (and
        (not (current_num ?c ?n))
        (oneof
            (current_num ?c ?r1)
            (current_num ?c ?r2)
            (current_num ?c ?r3)
        )

        (oneof
            (and 
                (not (current_num ?ca ?curr_a)) 
                (current_num ?ca ?ra)
            )
            (and 
                (not (current_num ?cb ?curr_b)) 
                (current_num ?cb ?rb)
            )
            (and 
                (not (current_num ?cc ?curr_c)) 
                (current_num ?cc ?rc)
            )
        )

        (increase (total-cost) 10)
    )
)

(:action multiple_oneof
    :parameters (?c - cell ?n ?goal ?r1 ?r2 - number ?ca - cell ?curr_a ?ra - number ?cb - cell ?curr_b ?rb - number ?cc - cell ?curr_c ?rc - number)
    :precondition (and 
        (current_num ?c ?n)
        (goal ?c ?goal)
        (lesser ?n ?goal)

        (mul ?n num2 ?r1)
        (mul ?n num3 ?r2)

        (connect ?c ?ca)
        (connect ?c ?cb)
        (connect ?c ?cc)
        (current_num ?ca ?curr_a)
        (current_num ?cb ?curr_b)
        (current_num ?cc ?curr_c)
        (mul ?curr_a num2 ?ra)
        (mul ?curr_b num2 ?rb)
        (mul ?curr_c num2 ?rc)
    )
    :effect (and 
        (not (current_num ?c ?n))
        (oneof
            (current_num ?c ?r1)
            (current_num ?c ?r2)
        )

        (oneof
            (and
                (not (current_num ?ca ?curr_a))
                (current_num ?ca ?ra)
            )
            (and
                (not (current_num ?cb ?curr_b))
                (current_num ?cb ?rb)
            )
            (and
                (not (current_num ?cc ?curr_c))
                (current_num ?cc ?rc)
            )
        )

        (increase (total-cost) 1)
    )
)

(:action substract_one
    :parameters (?c - cell ?n ?goal ?r ?count1 ?count2 - number)
    :precondition (and 
        (current_num ?c ?n)
        (goal ?c ?goal)
        (greater ?n ?goal)
    
        (sub ?n num1 ?r)

        ; (sub_count ?count1)
        ; (succ ?count1 ?count2) ; maximum number of subtract is 5 since in the problem.pddl, it only goes to (succ num4 num5)
    )
    :effect (and 
        (not (current_num ?c ?n))
        (current_num ?c ?r)

        (increase (total-cost) 5)

        ; (not (sub_count ?count1))
        ; (sub_count ?count2) 
    )
)


(:action done
    :parameters ()
    :precondition (and 
        (forall (?c - cell ?n - number) 
            (and
                (current_num ?c ?n)
                (goal ?c ?n)
            )
        )
    )
    :effect (and 
        (solved)
    )
)



)