(define (problem missionaries-and-cannibals)
    (:domain river-crossing)
    (:objects
        missionary1 cannibal1
        missionary2 cannibal2
        missionary3 cannibal3
        boat - boat
        start left
        end right
    )
    (:init
        (at missionary1 left)
        (at cannibal1 left)
        (at missionary2 left)
        (at cannibal2 left)
        (at missionary3 left)
        (at cannibal3 left)
        (at boat left)
        (shore left)
        (shore right)
    )
    (:goal
        (and
            (at missionary1 right)
            (at cannibal1 right)
            (at missionary2 right)
            (at cannibal2 right)
            (at missionary3 right)
            (at cannibal3 right)
            (shore right)
        )
    )
    (:operators
        ; Move two people from one side to the other
        (:action move-two
            :parameters (?person1 - person ?person2 - person ?from - shore ?to - shore)
            :precondition (and
                (at ?person1 ?from)
                (at ?person2 ?from)
                (at boat ?from)
                (shore ?from)
                (shore ?to)
                (not (overloaded ?from))
            )
            :effect (and
                (not (at ?person1 ?from))
                (not (at ?person2 ?from))
                (at ?person1 ?to)
                (at ?person2 ?to)
                (at boat ?to)
                (not (at boat ?from))
            )
        )
        ; Move one person from one side to the other
        (:action move-one
            :parameters (?person - person ?from - shore ?to - shore)
            :precondition (and
                (at ?person ?from)
                (at boat ?from)
                (shore ?from)
                (shore ?to)
                (not (overloaded ?from))
            )
            :effect (and
                (not (at ?person ?from))
                (at ?person ?to)
                (at boat ?to)
                (not (at boat ?from))
            )
        )
    )
)
