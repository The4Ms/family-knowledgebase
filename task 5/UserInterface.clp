(defrule displayPersonByNameUserInterface
	(Selected 21)
=>
	(printout t "What is the person name ? " crlf)
	(bind ?name (readline))
	
	(assert (DisplayPerson ?name))
)


(defrule displayPersonByChildUserInterface
	(Selected 221)
=>
	(printout t "What is the name of the child ? " crlf)
	(bind ?name (readline))
	
	(assert (DisplayPersonByChild ?name))
)

(defrule displayPersonBySpouseUserInterface
	(Selected 222)
=>
	(printout t "What is the name of the spouse ? " crlf)
	(bind ?name (readline))
	
	(assert (DisplayPersonBySpouse ?name))
)