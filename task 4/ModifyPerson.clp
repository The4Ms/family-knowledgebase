(defrule ModifyPersonQuery

	?queryIndex1 <- (ModifyPersonKomalo ?personName ?newName ?newGender ?newBirthYear ?newHeight ?newSpouse)
	?queryIndex2 <- (ModifyPersonParentsKomalo ?personName $?newParents)
	?queryIndex3 <- (ModifyPersonSiblingsKomalo ?personName $?newSiblings)

	?personIndex <- (Person (name ?personName)
			(gender ?currentGender)
			(parents $?currentParents)
			(spouse ?currentSpouse)
			(siblings $?currentSiblings)
			(height ?currentHeight)
			(birthYear ?currentBirthYear)
	)

=>

	(if(eq ?newName "_") then (bind ?newName ?personName))

	(if(eq ?newGender _) then (bind ?newGender ?currentGender))

	(if(eq ?newBirthYear _) then (bind ?newBirthYear ?currentBirthYear))
	
	(if(eq ?newHeight _) then (bind ?newHeight ?currentHeight))

	(if(eq ?newSpouse "_") then (bind ?newSpouse ?currentSpouse))

	(if(member$ _ ?newParents) then (bind ?newParents ?currentParents))

	(if(member$ _ ?newSiblings) then (bind ?newSiblings ?currentSiblings))

	?personIndex <- (modify ?personIndex 
			(name ?newName)
			(gender ?newGender)
			(spouse ?newSpouse)
			(height ?newHeight)
			(birthYear ?newBirthYear)
			(siblings ?newSiblings)
			(parents ?newParents)
	)

	(printout t ?personName " data updated successfully" crlf)

	(retract ?queryIndex1)
	(retract ?queryIndex2)
	(retract ?queryIndex3)
)