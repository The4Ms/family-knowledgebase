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

(defrule PersonDisplayByChild
	?factIdx1 <- (DisplayPersonByChild ?childName)
	(Person (name ?childName)(parents ?parent1 ?parent2))
	
=>
	(retract ?factIdx1)
	(assert (DisplayPerson ?parent1))
	(assert (DisplayPerson ?parent2))
)

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