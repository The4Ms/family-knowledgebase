(defrule PersonQuery
	(QueryHeight ?queryType ?queryheight)
	
	(QueryGender ?queryGender)

	(Person (name ?personName)
			(height ?personHeight)
			(gender ?personGender)
	)
	
	(or 
		(test(eq ?queryGender all))
		(test(eq ?personGender ?queryGender))
	)

	(or
		(test(eq ?queryType all))
		
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
	
	(printout t ?personName crlf)

)
