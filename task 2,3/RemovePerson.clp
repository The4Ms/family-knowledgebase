
(defrule removePersonUserInterface
	(Selected 24)
=>
	(printout t "Who are the person you want to remove?" crlf)
	(bind ?personName (readline))
	
	(assert (RemovePerson ?personName))
)

(defrule personRemoval
	?removePersonIndex <- (RemovePerson ?name)
	?personIndex <- (Person (name ?name))
=>
	(retract ?removePersonIndex)
	(retract ?personIndex)
	(printout t "Removed member " ?name crlf)
)