(defrule personRemoval
	?factIdx1 <- (RemovePerson ?name)
	?factIdx2 <- (Person (name ?name)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(retract ?factIdx2)
)

(defrule cleanFacts
	?factIdx1 <- (CleanFacts)
	(or
		?factIdx2 <- (RemoveRelations ?)
		?factIdx2 <- (RemovePerson ?)
		?factIdx2 <- (ModifyPersonName ? ?)
		?factIdx2 <- (ModifyPersonGender ? ?)
		?factIdx2 <- (ModifyPersonBirthYear ? ?)
		?factIdx2 <- (ModifyPersonBirthYearFlag ? ?)
		?factIdx2 <- (ModifyPersonHeight ? ?)
		?factIdx2 <- (ModifyPersonHeightFlag ? ?)
		?factIdx2 <- (ModifyPersonParents ? $?)
		?factIdx2 <- (ModifyPersonSiblings ? $?)
		?factIdx2 <- (ModifyPersonSpouse ? ?)
	)
	=>
	(retract ?factIdx1)
	(retract ?factIdx2)
)

(defrule personNameModification
	?factIdx1 <- (ModifyPersonName ?oldName ?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (name ?val))
)

(defrule personGenderModification
	?factIdx1 <- (ModifyPersonGender ?oldName ?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (gender ?val))
)

(defrule personBirthYearModification
	?factIdx1 <- (ModifyPersonBirthYear ?oldName ?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (birthYear ?val))
)

(defrule personBirthYearFlagModification
	?factIdx1 <- (ModifyPersonBirthYearFlag ?oldName ?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (birthYearFlag ?val))
)

(defrule personHeightModification
	?factIdx1 <- (ModifyPersonHeight ?oldName ?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (height ?val))
)

(defrule personHeightFlagModification
	?factIdx1 <- (ModifyPersonHeightFlag ?oldName ?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (heightFlag ?val))
)

(defrule personParentsModification
	?factIdx1 <- (ModifyPersonParents ?oldName $?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (parents ?val))
)

(defrule personSiblingsModification
	?factIdx1 <- (ModifyPersonSiblings ?oldName $?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (siblings ?val))
)

(defrule personSpouseModification
	?factIdx1 <- (ModifyPersonSpouse ?oldName ?val)
	?factIdx2 <- (Person (name ?oldName)
						 (gender ?)
						 (birthYear ?)
						 (birthYearFlag ?)
						 (height ?)
						 (heightFlag ?)
						 (parents $?)
						 (siblings $?)
					 	 (spouse ?)
				 )
	=>
	(retract ?factIdx1)
	(modify ?factIdx2 (spouse ?val))
)

(defrule PersonDisplay
	?factIdx1 <- (DisplayPerson ?name)
	(Person (name ?name)
			(gender ?g)
			(birthYear ?b)
			(birthYearFlag ?bf)
			(height ?h)
			(heightFlag ?hf)
			(parents $?p)
			(siblings $?s)
			(spouse ?sp)
	)
	=>
	(retract ?factIdx1)
	(printout t "Name: " ?name crlf
				"Gender: " ?g crlf
				"Parents: " ?p crlf
				"Sibling: " ?s crlf
				"Spouse: " ?sp crlf
	)
	(if (eq ?bf m) then (printout t "Younger then: " ?b crlf))
	(if (eq ?bf l) then (printout t "Older then: " ?b crlf))
	(if (eq ?bf e) then (printout t "Birth year: " ?b crlf))
	(if (eq ?hf m) then (printout t "Taller then: " ?h crlf))
	(if (eq ?hf l) then (printout t "Shortet then: " ?h crlf))
	(if (eq ?hf e) then (printout t "Height: " ?h crlf))
)
