
(defrule isGrandfather2
	(Selected 16)
	(Grandfather ?grandfatherName ?grandchildName)
	=>
	(printout t ?grandfatherName " is " ?grandchildName "'s grandfather" crlf)
	(assert (CompareHeight ?grandfatherName ?grandchildName))
)

(defrule isGrandfather
	(Person (name ?grandfatherName)(gender m)(parents $?))
	(Person (name ?grandchildName)(parents ?parent1Name ?parent2Name))

	(or
		(Parent ?grandfatherName ?parent1Name)
		(Parent ?grandfatherName ?parent2Name)
	)
	=>
	(assert (Grandfather ?grandfatherName ?grandchildName))
)

(defrule isGrandmother2
	(Selected 17)
	
	(Grandmother ?grandmotherName ?grandchildName)
	=>
	(printout t ?grandmotherName " is " ?grandchildName "'s grandmother" crlf)
	(assert (CompareHeight ?grandmotherName ?grandchildName))
)

(defrule isGrandmother
	
	(Person (name ?grandmotherName)(gender f)(parents $?))
	(Person (name ?grandchildName)(parents ?parent1Name ?parent2Name))

	(or
		(Parent ?grandmotherName ?parent1Name)
		(Parent ?grandmotherName ?parent2Name)
	)
	=>
	(assert (Grandmother ?grandmotherName ?grandchildName))
)
