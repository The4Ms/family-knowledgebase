(defrule EditPerson
	(Selected 25)

=>

	(printout t "To skip any question, just write _ and press enter" crlf)

	(printout t "What is the person name you want to edit ?" crlf)
	(bind ?inputCurrentName (readline))

	(printout t "What is the person new name ?" crlf)
	(bind ?inputNewName (readline))
	
	(printout t "What is the person new gender ? (m/f): " crlf)
	(bind ?inputGender (read))
	
	(printout t "What is the person new birthyear ?: " crlf)
	(bind ?inputBirthYear (read))
	
	(printout t "What is the person new height ? in cm: " crlf)
	(bind ?inputHeight (read))
	
	(printout t "Who are his/her new parents ? (seperated by space): " crlf)
	(bind ?inputParents (explode$ (readline)))
	
	(printout t "Who are his/her new siblings ? (seperated by space): " crlf)
	(bind ?inputSiblings (explode$ (readline)))
	
	(printout t "Who are his/her new spouse ? (only one) : " crlf)
	(bind ?inputSpouse (readline))
	
	(assert
		(ModifyPersonKomalo ?inputCurrentName ?inputNewName ?inputGender ?inputBirthYear ?inputHeight ?inputSpouse)
	)

	(assert (ModifyPersonParentsKomalo ?inputCurrentName ?inputParents))
	(assert (ModifyPersonSiblingsKomalo ?inputCurrentName ?inputSiblings))

)