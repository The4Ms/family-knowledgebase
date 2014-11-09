(defrule ShowMainMenu
	(not (Selected ?))
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
	(printout t "      221- Display a familly member by child name" crlf)
	(printout t "      221- Display a familly member by spouse name" crlf)
	(printout t "      23- Add family member" crlf)
	(printout t "      24- Remove family member" crlf)
	(printout t "      25- Modify familly member properties" crlf)
	(printout t "- Search familly members by properties" crlf)
	(printout t "      41- Show all individuals that match a combination of properties familly knowledge base" crlf)

	(bind ?selectedOption (read))

	(assert(Selected ?selectedOption))
)

(defrule ClearSelected
	(declare (salience -10000))

	?selectedIndex <- (Selected ?)
=>
	(retract ?selectedIndex)
)
