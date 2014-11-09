(clear)
(load "..\\..\\PersonTemplate.clp")
(load "..\\..\\PersonsFacts.clp")

(reset)

(load "PersonHeight.clp")

(assert(QueryGender all))
(assert(QuerySpouse all))
(assert(QueryParent all))
(assert(QuerySiblings all))

(bind ?FactIndex (assert(QueryHeight "equals to" 180)))
(run)

(retract ?FactIndex)
(bind ?FactIndex (assert(QueryHeight "less than" 180)))
(run)

(retract ?FactIndex)
(bind ?FactIndex (assert(QueryHeight "greater than" 175)))
(run)

