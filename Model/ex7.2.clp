(deftemplate schema
 
 (slot Intrebare) 
 (slot Raspuns) 
 
 ) 
(assert (schema (Intrebare nil) (Raspuns nil))) 
(printout t "Is it very big ? (YES/NO)" crlf) 
(bind ?r (read))
(assert (schema (Intrebare "Is it very big ?") (Raspuns
?r))) 
if (( = (?r NO))) then
	(printout t "Does it squeak ? (YES/NO)" crlf) 
 	(bind ?r (read))
 	(assert(schema (Intrebare "Does it squeak ?") (Raspuns
	?r)))
	if (( = (?r NO))) then
	(printout t "Guess Squirrel")
	else
	(printout t "Guess mouse")

(run)