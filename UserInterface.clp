(defrule ShowMainMenu

=>
	(printout t "- Infering relations about:" crlf)
	(printout t "      1- cousins " crlf)
	(printout t "      2- Nephews" crlf)
	(printout t "      3- Nieces" crlf)
	(printout t "      4- Uncle" crlf)
	(printout t "      5- Aunt" crlf)
	(printout t "      6- Grandfather" crlf)
	(printout t "      7- Grandmother" crlf)
	(printout t "- Modifiy familly knowledge base" crlf)
	(printout t "      8- Display a familly member by name" crlf)
	(printout t "      9- Display a familly member by data" crlf)
	(printout t "      9- Add family member" crlf)
	(printout t "      10- Modify family member properties" crlf)
	(printout t "      11- Remove family member" crlf)
	(printout t "- Search familly members by properties" crlf)
	(printout t "      12- Show all individuals that match a combination of properties familly knowledge base" crlf)

	(bind ?selectedOption (read))

	(assert(Selected ?selectedOption))
)

(defrule GetQueryData
	(Selected 12)
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
