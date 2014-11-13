(defrule isParent
	(Person (name ?parentName))
	(Person (name ?childName) (parents ?parent1 ?parent2))
	(or
		(test (eq ?parentName ?parent1))
		(test (eq ?parentName ?parent2))
	)
	=>
	(assert (Parent ?parentName ?childName))
)

(defrule isSibling
	(Person (name ?name) (parents ?p11 ?p12))
	(Person (name ?siblingName) (parents ?p21 ?p22))

	(test (neq ?name ?siblingName))
	(or
		(and
			(test (eq ?p11 ?p21))
			(test (eq ?p12 ?p22))
			(test (neq ?p11 ""))
			(test (neq ?p12 ""))
		)
		
		(and
			(test (eq ?p11 ?p22))
			(test (eq ?p12 ?p21))
			(test (neq ?p11 ""))
			(test (neq ?p12 ""))
		)
	)
	=>
	(assert (Sibling ?name ?siblingName))
)

(defrule isSpouse
	(Person (name ?name1)(spouse ?name2))
	(Person (name ?name2)(spouse ?name1))
	=>
	(assert (Spouse ?name1 ?name2))
)


(defrule personRelationsRemoval
	(RemoveRelations ?name)
	(or
		?factIdx <- (Parent ?name ?)
		?factIdx <- (Parent ? ?name)
		?factIdx <- (Sibling ?name ?)
		?factIdx <- (Sibling ? ?name)
		?factIdx <- (Spouse ?name ?)
		?factIdx <- (Spouse ? ?name)
		?factIdx <- (Nephew ?name ?)
		?factIdx <- (Nephew ? ?name)
		?factIdx <- (Niece ?name ?)
		?factIdx <- (Niece ? ?name)
		?factIdx <- (Uncle ?name ?)
		?factIdx <- (Uncle ? ?name)
		?factIdx <- (Aunt ?name ?)
		?factIdx <- (Aunt ? ?name)
		?factIdx <- (Cousin ?name ?)
		?factIdx <- (Cousin ? ?name)
		?factIdx <- (Grandfather ?name ?)
		?factIdx <- (Grandfather ? ?name)
		?factIdx <- (Grandmother ?name ?)
		?factIdx <- (Grandmother ? ?name)
	)
	=>
	(retract ?factIdx)
)