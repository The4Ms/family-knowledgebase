(defrule CompareHeightsAndPrintIt
	(CompareHeight ?name1 ?name2)
	(Person (name ?name1)(height ?height1))
	(Person (name ?name2)(height ?height2))
	=>

	(if(> ?height1 ?height2) then (printout t ", " ?name1 " is taller in height than " ?name2 crlf))

	(if(< ?height1 ?height2) then (printout t ", " ?name1 " is shorter in height than " ?name2 crlf))

	(if(= ?height1 ?height2) then (printout t ", " ?name1 " is equal in height of " ?name2 crlf))	
)