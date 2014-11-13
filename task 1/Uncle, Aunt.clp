
(defrule isUncle2
	(Selected 14)
	(Uncle ?uncleName ?name)
	
	=>
	
	(printout t ?uncleName " is " ?name "'s uncle")
	(assert (CompareHeight ?uncleName ?name))
)

(defrule isUncle
	(Person (name ?uncleName)(gender m))
	(Person (name ?name)(parents ?parent1 ?parent2))

	(Sibling ?uncleName ?siblingName2)
	(or
		(test (eq ?siblingName2 ?parent1))
		(test (eq ?siblingName2 ?parent2))
	)
	=>
	(assert (Uncle ?uncleName ?name))
)

(defrule isAunt2
	(Selected 15)
	(Aunt ?auntName ?name)
	=>
	(printout t ?auntName " is " ?name "'s aunt")
	(assert (CompareHeight ?auntName ?name))
)

(defrule isAunt
	
	(Person (name ?auntName)(gender f))
	(Person (name ?name)(parents ?parent1 ?parent2))

	(Sibling ?auntName ?siblingName2)
	(or
		(test (eq ?siblingName2 ?parent1))
		(test (eq ?siblingName2 ?parent2))
	)
	=>
	(assert (Aunt ?auntName ?name))
)