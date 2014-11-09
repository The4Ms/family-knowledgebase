
(defrule isUncle
	(Selected 14)
	
	(Person (name ?uncleName)(gender m))
	(Person (name ?name)(parents ?parent1 ?parent2))

	(Sibling ?uncleName ?siblingName2)
	(or
		(test (eq ?siblingName2 ?parent1))
		(test (eq ?siblingName2 ?parent2))
	)
	=>
	(assert (Uncle ?uncleName ?name))
	(printout t ?uncleName " is " ?name "'s uncle" crlf)
)

(defrule isAunt
	(Selected 15)
	
	(Person (name ?auntName)(gender f))
	(Person (name ?name)(parents ?parent1 ?parent2))

	(Sibling ?auntName ?siblingName2)
	(or
		(test (eq ?siblingName2 ?parent1))
		(test (eq ?siblingName2 ?parent2))
	)
	=>
	(assert (Aunt ?auntName ?name))
	(printout t ?auntName " is " ?name "'s aunt" crlf)
)