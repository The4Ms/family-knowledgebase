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
		)
		
		(and
			(test (eq ?p11 ?p22))
			(test (eq ?p12 ?p21))
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

(defrule isNephew
	(Selected 12)

	(Person (name ?name))
	(Person (name ?nephewName)(gender m)(parents ?parent1 ?parent2))

	(or
		(Sibling ?name ?parent1)
		(Sibling ?name ?parent2)
	)
	=>
	(assert (Nephew ?nephewName ?name))
	(printout t ?nephewName " is " ?name "'s nephew" crlf)
)

(defrule isNiece
	(Selected 13)

	(Person (name ?name))
	(Person (name ?nieceName)
			(gender f)
			(parents ?parent1 ?parent2)
	)
	(or
		(Sibling ?name ?parent1)
		(Sibling ?name ?parent2)
	)
	=>
	(assert (Niece ?nieceName ?name))
	(printout t ?nieceName " is " ?name "'s niece" crlf)
)

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

(defrule isCousin
	(Selected 11)
	
	(Person (name ?cousin1Name)(parents ?cousin1Parent1Name ?cousin1Parent2Name))
	(Person (name ?cousin2Name)(parents ?cousin2Parent1Name ?cousin2Parent2Name))

	(or
		(Uncle ?cousin1Parent1Name ?cousin2Name)
		(Aunt ?cousin1Parent1Name ?cousin2Name)
		(Uncle ?cousin1Parent2Name ?cousin2Name)
		(Aunt ?cousin1Parent2Name ?cousin2Name)
		
		(Uncle ?cousin2Parent1Name ?cousin1Name)
		(Aunt ?cousin2Parent1Name ?cousin1Name)
		(Uncle ?cousin2Parent2Name ?cousin1Name)
		(Aunt ?cousin2Parent2Name ?cousin1Name)
	)
	=>
	(assert (Cousin ?cousin1Name ?cousin2Name))
	(printout t ?cousin1Name " is " ?cousin2Name "'s cousin" crlf)
)

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