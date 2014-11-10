(defrule PersonQueryClear
	(declare (salience -10000))
	
	?in1<-(QueryGender ?)
	?in2<-(QuerySpouse ?)
	?in3<-(QueryParent ?)
	?in4<-(QuerySiblings ?)
	?in5<-(QueryHeight ? ?)
	?in6<-(QueryAge ? ?)
	
=>
	(retract ?in1)
	(retract ?in2)
	(retract ?in3)
	(retract ?in4)
	(retract ?in5)
	(retract ?in6)
)

	

(defrule PersonQuery
	?in1<-(QueryGender ?queryGender)
	?in2<-(QuerySpouse ?querySpouse)
	?in3<-(QueryParent ?queryParent)
	?in4<-(QuerySiblings ?querySiblings)
	?in5<-(QueryHeight ?queryHeightType ?queryHeight)
	?in6<-(QueryAge ?queryAgeType ?queryAge)

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
