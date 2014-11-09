
(defrule isGrandfather
	(Selected 16)
	(Person (name ?grandfatherName)(gender m)(parents $?))
	(Person (name ?grandchildName)(parents ?parent1Name ?parent2Name))

	(or
		(Parent ?grandfatherName ?parent1Name)
		(Parent ?grandfatherName ?parent2Name)
	)
	=>
	(assert (Grandfather ?grandfatherName ?grandchildName))
	(printout t ?grandfatherName " is " ?grandchildName "'s grandfather" crlf)
)

(defrule isGrandmother
	(Selected 17)
	
	(Person (name ?grandmotherName)(gender f)(parents $?))
	(Person (name ?grandchildName)(parents ?parent1Name ?parent2Name))

	(or
		(Parent ?grandmotherName ?parent1Name)
		(Parent ?grandmotherName ?parent2Name)
	)
	=>
	(assert (Grandmother ?grandmotherName ?grandchildName))
	(printout t ?grandmotherName " is " ?grandchildName "'s grandmother" crlf)
)
