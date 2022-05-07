(deftemplate schema
 
 (slot Intrebare) 
 (slot Raspuns) 
 
 ) 
(assert (schema (Intrebare nil) (Raspuns nil))) 
(defrule Intrebare1
 
 (schema (Intrebare nil) (Raspuns nil))
 
 =>
 
 (printout t "Is it very big ? (YES/NO)" crlf) 
 (bind ?r (read))
    (assert (schema (Intrebare "Is it very big ?") (Raspuns
?r))) 
 
 ) 
(defrule Intrebare2
 
 (schema (Intrebare "Is it very big ?") (Raspuns NO))
 
 =>
 
 (printout t "Does it squeak ? (YES/NO)" crlf) 
 (bind ?r (read))
 (assert(schema (Intrebare "Does it squeak ?") (Raspuns
?r))) 
 
 ) 
(defrule Intrebare3
 
 (schema (Intrebare "Is it very big ?") (Raspuns YES))
 
 =>
 
 (printout t "Does it have a long neck ?" crlf) 
 (bind ?r (read))
 (assert (schema (Intrebare "Does it have a long neck ?") 
(Raspuns ?r))) 
 
 ) 
(defrule Veverita
 
 (schema (Intrebare "Does it squeak ?") (Raspuns NO))
 
 =>
 
 (printout t "Guess squirrel" crlf) 
 
 ) 
(defrule Soarece 
 
 (schema (Intrebare "Does it squeak ?") (Raspuns YES))
 
 =>
    (printout t "Guess mouse" crlf) 
 
 ) 
(defrule Intrebare4
 
 (schema (Intrebare "Does it have a long neck ?") (Raspuns 
NO))
 
 =>
 
 (printout t "Does it have a trunk ? (YES/NO)" crlf) 
 (bind ?r (read))
 (assert (schema (Intrebare "Does it have a trunk ?") 
(Raspuns ?r))) 
 
 ) 
(defrule Girafa 
 
 (schema (Intrebare "Does it have a long neck ?") (Raspuns 
YES))
 
 =>
 
 (printout t "Guess giraffe" crlf) 
 
 ) 
(defrule Intrebare5
 
 (schema (Intrebare "Does it have a trunk ?") (Raspuns NO))
 
 =>
 
 (printout t "Does it have to be in water ? (YES/NO)" crlf) 
 (bind ?r (read))
 (assert (schema (Intrebare "Does it have to be in water ?") 
(Raspuns ?r))) 
 
 ) 
(defrule Elefant
    (schema (Intrebare "Does it have a trunk ?") (Raspuns YES))
 
 =>
 
 (printout t "Guess elephant" crlf) 
 
 ) 
(defrule Rinocer
 
 (schema (Intrebare "Does it have to be in water ?") (Raspuns 
NO))
 
 =>
 
 (printout t "Guess Rhino" crlf) 
 
 ) 
(defrule Hipopotam
 
 (schema (Intrebare "Does it have to be in water ?") (Raspuns 
YES))
 
 =>
 
 (printout t "Guess Hippo" crlf) 
 
 ) 
(run) 
(facts)