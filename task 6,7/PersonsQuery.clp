(defrule PersonQuery
	(QueryGender ?queryGender)
	(QuerySpouse ?querySpouse)
	(QueryParent ?queryParent)
	(QuerySiblings ?querySiblings)
	(QueryHeight ?queryHeightType ?queryHeight)
	(QueryAge ?queryAgeType ?queryAge)

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
			(birthYear ?birthyear)
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
		(test(eq ?queryHeightType "all"))

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

	(or
		(test(eq ?queryAgeType "all"))

		(test(and (eq ?queryAgeType "equals to")
				  (= (abs(- ?birthyear ?*CURRENT_YEAR*)) ?queryAge)
			 )
		)

		(test(and (eq ?queryAgeType "older than")
				  (> (abs(- ?birthyear ?*CURRENT_YEAR*)) ?queryAge)
			 )
		)

		(test(and (eq ?queryAgeType "younger than")
				  (< (abs(- ?birthyear ?*CURRENT_YEAR*)) ?queryAge)
			 )
		)
	)

	=>
	
	(printout t ?personName crlf)

)
