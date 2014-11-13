(defrule CompareHeightsAndPrintIt
	(CompareHeight ?name1 ?name2)
	(Person (name ?name1)(height ?height1))
	(Person (name ?name2)(height ?height2))
	=>

	(if(> ?height1 ?height2) then (printout t "and just for the record between you and me, " ?name1 " is taller than " ?name2 crlf crlf))

	(if(< ?height1 ?height2) then (printout t "and just for the record between you and me, " ?name1 " is shorter than " ?name2 crlf crlf))

	(if(= ?height1 ?height2) then (printout t "and just for the record between you and me, " ?name1 " has the same height as " ?name2 crlf crlf))	
)