(clear)
(load "..\\..\\PersonTemplate.clp")
(load "..\\..\\PersonsFacts.clp")

(reset)

(load "PersonHeight.clp")

(assert(QueryHeight "equals to" 180))
(run)

(assert(QueryHeight "less than" 180))
(run)

(assert(QueryHeight "greater than" 175))
(run)

