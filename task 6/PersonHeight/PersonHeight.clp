(defrule PersonHeightEquals
	(QueryHeight ?queryType ?queryheight)
	(Person (name ?personName)(height ?personHeight))

	(or
		(test(and (eq ?queryType "equals to")
				  (= ?personHeight ?queryheight)
			 )
		)

		(test(and (eq ?queryType "greater than")
				  (> ?personHeight ?queryheight)
			 )
		)

		(test(and (eq ?queryType "less than")
				  (< ?personHeight ?queryheight)
			 )
		)
	)
	=>
	
	(printout t ?personName "'s height " ?queryType " " ?queryheight " (person's height " ?personHeight ")" crlf)

)
