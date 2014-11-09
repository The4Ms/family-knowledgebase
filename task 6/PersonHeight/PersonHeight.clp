(defrule PersonQuery
	(QueryGender ?queryGender)
	(QuerySpouse ?querySpouse)
	(QueryParent ?queryParent)
	(QuerySiblings ?querySiblings)
	(QueryHeight ?queryHeightType ?queryHeight)

	(Person (name ?personName)
			(gender ?personGender)
			(parents $?personParent&:(or
										(eq ?queryParent all)
										(member$ ?queryParent ?personParent)
									)
			)
			(spouse ?personSpouse)
			(siblings $?personSiblings&:(or
										(eq ?querySiblings all)
										(member$ ?querySiblings ?personSiblings)
									)
			)
			(height ?personHeight)
	)

	(or 
		(test(eq ?queryGender all))
		(test(eq ?personGender ?queryGender))
	)

	(or 
		(test(eq ?querySpouse all))
		(test(eq ?personSpouse ?querySpouse))
	)


	(or
		(test(eq ?queryHeightType all))

		(test(and (eq ?queryHeightType "equals to")
				  (= ?personHeight ?queryHeight)
			 )
		)

		(test(and (eq ?queryHeightType "greater than")
				  (> ?personHeight ?queryHeight)
			 )
		)

		(test(and (eq ?queryHeightType "less than")
				  (< ?personHeight ?queryHeight)
			 )
		)
	)

	=>
	
	(printout t ?personName crlf)

)
