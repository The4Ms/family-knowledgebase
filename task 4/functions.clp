(deffunction modifyPerson ()
	(printout t "person old name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person name: " crlf)
	(bind ?inputName (read))
	
	(printout t "person gender (m/f): " crlf)
	(bind ?inputGender (read))
	
	(printout t "person birthyear: " crlf)
	(bind ?inputBirthYear (read))
	
	(printout t "person birthyear flag: " crlf)
	(printout t "'l' for less than" crlf)
	(printout t "'m' for more than" crlf)
	(printout t "'e' for equals" crlf)
	(bind ?inputBirthYearFlag  (read))
	
	(printout t "person height : " crlf)
	(bind ?inputHeight (read))
	
	(printout t "person height flag: " crlf)
	(printout t "'l' for less than" crlf)
	(printout t "'m' for more than" crlf)
	(printout t "'e' for equals" crlf)
	(bind ?inputHeightFlag   (read))
	
	(printout t "person parents: " crlf)
	(bind ?inputParents (explode$ (readline)))
	
	(printout t "person siblings : " crlf)
	(bind ?inputSiblings (explode$ (readline)))
	
	(printout t "person spouse : " crlf)
	(bind ?inputSpouse (read))
	
	(assert
		(Person
			(name ?inputName)
			(gender ?inputGender)
			(birthYear ?inputBirthYear)
			(birthYearFlag ?inputBirthYearFlag)
			(height ?inputHeight)
			(heightFlag ?inputHeightFlag)
			(parents ?inputParents)
			(siblings ?inputSiblings)
			(spouse ?inputSpouse)
		)
	)
	
	(assert (RemovePerson ?oldName))
	(assert (RemoveRelations ?oldName))
	(run)
	(assert (CleanFacts))
	(run)
)

(deffunction removePerson ()
	(printout t "person old name: " crlf)
	(bind ?oldName (read))
	
	(assert (RemovePerson ?oldName))
	(assert (RemoveRelations ?oldName))
	(run)
	(assert (CleanFacts))
	(run)
)

(deffunction modifyPersonName ()
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

(deffunction modifyPersonGender ()
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

(deffunction modifyPersonBirthYear ()
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person birthYear: " crlf)
	(bind ?inputBirthYear (read))
	
	(assert (ModifyPersonBirthYear ?oldName ?inputBirthYear))
	(run)
)

(deffunction modifyPersonBirthYearFlag ()
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person birthYear flag: " crlf)
	(bind ?inputBirthYearFlag (read))
	
	(assert (ModifyPersonBirthYearFlag ?oldName ?inputBirthYearFlag))
	(run)
)

(deffunction modifyPersonHeight ()
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person height: " crlf)
	(bind ?inputHeight (read))
	
	(assert (ModifyPersonHeight ?oldName ?inputHeight))
	(run)
)

(deffunction modifyPersonHeightFlag ()
	(printout t "person name: " crlf)
	(bind ?oldName (read))
	
	(printout t "person height: " crlf)
	(bind ?inputHeightFlag (read))
	
	(assert (ModifyPersonHeightFlag ?oldName ?inputHeightFlag))
	(run)
)

(deffunction modifyPersonParents ()
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

(deffunction modifyPersonSiblings ()
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

(deffunction modifyPersonSpouse ()
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
