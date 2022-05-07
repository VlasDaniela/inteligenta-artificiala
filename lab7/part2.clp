;Ex1 - b

(deftemplate arca
    (slot animal) 
    (slot gen)
    (slot inaltime)
)


(foreach ?animal (create$ soarece veverita)
	(foreach ?gen (create$ masculin feminin)
        (printout t "Inaltimea animalului " ?animal " de genul " ?gen " este: " )
        (bind ?inaltime (read))
		(assert (arca (animal ?animal)(gen ?gen)(inaltime ?inaltime)))
	)
)

(defrule rule
    (arca (animal $?A) {inaltime >= 4})
    
    =>
    
    (printout t "Animal: " $?A crlf)

)



(run)