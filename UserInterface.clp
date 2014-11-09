(defrule ShowMainMenu

=>
	(printout t "- Infering relations about:" crlf)
	(printout t "      11- cousins " crlf)
	(printout t "      12- Nephews" crlf)
	(printout t "      13- Nieces" crlf)
	(printout t "      14- Uncle" crlf)
	(printout t "      15- Aunt" crlf)
	(printout t "      16- Grandfather" crlf)
	(printout t "      17- Grandmother" crlf)
	(printout t "- Familly knowledge base" crlf)
	(printout t "      21- Display a familly member by name" crlf)
	(printout t "      22- Display a familly member by parent" crlf)
	(printout t "      23- Add family member" crlf)
	(printout t "      24- Remove family member" crlf)
	(printout t "- Modify family member properties" crlf)
	(printout t "      31- Modify familly member name" crlf)
	(printout t "      32- Modify familly member gender" crlf)
	(printout t "      33- Modify familly member birthyear" crlf)
	(printout t "      34- Modify familly member height" crlf)
	(printout t "      35- Modify familly member parents" crlf)
	(printout t "      36- Modify familly member siblings" crlf)
	(printout t "      37- Modify familly member spouse" crlf)
	(printout t "- Search familly members by properties" crlf)
	(printout t "      41- Show all individuals that match a combination of properties familly knowledge base" crlf)

	(bind ?selectedOption (read))

	(assert(Selected ?selectedOption))
)

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
