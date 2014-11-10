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
	(printout t "Birth year: " ?b crlf)
	(printout t "Height: " ?h crlf)
)

(defrule PersonDisplayByChild
	?factIdx1 <- (DisplayPersonByChild ?childName)
	(Person (name ?childName)(parents ?parent1 ?parent2))
	
=>
	(retract ?factIdx1)
	(assert (DisplayPerson ?parent1))
	(assert (DisplayPerson ?parent2))
)

(defrule PersonDisplayBySpouse
	?factIdx1 <- (DisplayPersonBySpouse ?spouseName)
	(Person (name ?personName)(spouse ?spouseName))
	
=>
	(retract ?factIdx1)
	(assert (DisplayPerson ?personName))
)