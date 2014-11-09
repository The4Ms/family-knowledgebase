(defrule modifyPersonName 
	(Selected 31)
=>
	(printout t "person old name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person name: " crlf)
	(bind ?inputName (read))
	
	(assert (ModifyPersonName ?oldName ?inputName))
	(assert (RemoveRelations ?oldName))
	(run)
	(assert (CleanFacts))
	(run)
)

(defrule modifyPersonGender
	(Selected 32)
=>
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person gender: " crlf)
	(bind ?inputGender (read))
	
	(assert (ModifyPersonGender ?oldName ?inputGender))
	(assert (RemoveRelations ?oldName))
	(run)
	(assert (CleanFacts))
	(run)
)

(defrule modifyPersonBirthYear
	(Selected 33)
=>
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person birthYear: " crlf)
	(bind ?inputBirthYear (read))
	
	(assert (ModifyPersonBirthYear ?oldName ?inputBirthYear))
	(run)
)

(defrule modifyPersonHeight
	(Selected 34)
=>
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person height: " crlf)
	(bind ?inputHeight (read))
	
	(assert (ModifyPersonHeight ?oldName ?inputHeight))
	(run)
)

(defrule modifyPersonParents
	(Selected 35)
=>
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person parents: " crlf)
	(bind ?inputParents (explode$ (readline)))
	
	(assert (ModifyPersonParents ?oldName ?inputParents))
	(assert (RemoveRelations ?oldName))
	(run)
	(assert (CleanFacts))
	(run)
)

(defrule modifyPersonSiblings
	(Selected 36)
=>
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person siblings: " crlf)
	(bind ?inputSiblings (explode$ (readline)))
	
	(assert (ModifyPersonSiblings ?oldName ?inputSiblings))
	(assert (RemoveRelations ?oldName))
	(run)
	(assert (CleanFacts))
	(run)
)

(defrule modifyPersonSpouse
	(Selected 37)
=>
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person spouse: " crlf)
	(bind ?inputSpouse (read))
	
	(assert (ModifyPersonSpouse ?oldName ?inputSpouse))
	(assert (RemoveRelations ?oldName))
	(run)
	(assert (CleanFacts))
	(run)
)
