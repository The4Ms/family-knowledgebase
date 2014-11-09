
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