(defrule AddNewPerson
	(Selected 23)
=>
	(printout t "What is the person Name ?" crlf)
	(bind ?inputName (readline))
	
	(printout t "What is the person gender ? (m/f): " crlf)
	(bind ?inputGender (read))
	
	(printout t "In which year was the person born ?: " crlf)
	(bind ?inputBirthYear (read))
	
	(printout t "What is the person height ? in m/cm: " crlf)
	(bind ?inputHeight (read))
	
	(printout t "Who are his/her parents ? (seperated by space): " crlf)
	(bind ?inputParents (explode$ (readline)))
	
	(printout t "Who are his/her siblings ? (seperated by space): " crlf)
	(bind ?inputSiblings (explode$ (readline)))
	
	(printout t "Who are his/her spouse ? (only one) : " crlf)
	(bind ?inputSpouse (readline))
	
	(assert
		(Person
			(name ?inputName)
			(gender ?inputGender)
			(birthYear ?inputBirthYear)
			(height ?inputHeight)
			(parents ?inputParents)
			(siblings ?inputSiblings)
			(spouse ?inputSpouse)
		)
	)
)

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