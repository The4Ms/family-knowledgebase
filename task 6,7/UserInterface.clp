(defrule GetQueryData
	(Selected 41)
=>
	(printout t "Enter the criteria to search upon in the same order, write 'all' if you do not care about a specific property:" crlf)
	
	(printout t "What is the gender ? (m or f) or write 'all'" crlf)
	(bind ?answer (read))
	(assert (QueryGender ?answer))

	(printout t "What is the spouse name ? or write 'all'" crlf)
	(bind ?answer (read))
	(assert (QuerySpouse ?answer))
	
	(printout t "What is the name of one of parents ?  or write 'all'" crlf)
	(bind ?answer (read))
	(assert (QueryParent ?answer))
	
	(printout t "What is the name of one of siblings ?  or write 'all'" crlf)
	(bind ?answer (read))
	(assert (QuerySiblings ?answer))
	
	(printout t "What is the height range ? (equals to|greater than|less than) then press enter then input the height  or write 'all'" crlf)
	(bind ?type (readline))
	(bind ?height (read))
	(assert (QueryHeight ?type ?height))
	(printout t ?type crlf)

)
