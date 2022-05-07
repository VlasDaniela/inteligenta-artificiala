(defglobal ?*priorSlab* = 500)
(defglobal ?*priorTare* = 250)
(defglobal ?*priorNou* = 200)
(defglobal ?*priorVechi* = 100)



(deftemplate Meniu(slot mancare)(slot vin)(slot tarie)(slot vechime))

(deffacts Restaurant
    
    
    	(Meniu(mancare paste)(vin alb-sec)(tarie tare)(vechime nou))
    	(Meniu (mancare stridii)(vin alb-sec )(tarie tare)(vechime vechi))
    	(Meniu (mancare melci)(vin alb-sec )(tarie tare)(vechime nou))
    	(Meniu (mancare antreuri)(vin alb-demisec)(tarie slab)(vechime vechi))
    	(Meniu (mancare aperitive)(vin alb-sec )(tarie tare)(vechime vechi))
    	(Meniu (mancare carne-alba)(vin rosu-dulce )(tarie slab)(vechime nou))
    	(Meniu (mancare carne-rastel)(vin rosu-demisec )(tarie slab)(vechime nou))
    	(Meniu (mancare vanat)(vin rosu-sec )(tarie tare)(vechime nou))
    	(Meniu (mancare branzeturi-fermentate)(vin rosu-demidulce )(tarie slab)(vechime vechi))
    	(Meniu (mancare branzeturi-semidure)(vin rosu-demidulce )(tarie slab)(vechime vechi))
    	(Meniu (mancare branza-de-oaie)(vin rosu-sec )(tarie tare)(vechime nou))
    	(Meniu (mancare branza)(vin alb-sec )(tarie tare)(vechime vechi))
    	(Meniu (mancare deserturi-zahar)(vin spumant)(tarie slab)(vechime nou))
    	(Meniu (mancare fructe)(vin alb-dulce)(tarie slab)(vechime vechi))
    	(Meniu (mancare cafea)(vin vinare)(tarie slab)(vechime vechi))
    	(Meniu (mancare prajitura)(vin alb-demidulce)(tarie slab)(vechime vechi))
    
)

(reset)
(facts)
(run)


(defrule vinAlb
    (Meniu(mancare ?m)(vin alb-sec))
    =>
    (printout t "meniul care merge cu vin alb-sec este: " ?m crlf)
)

(run)

(defrule vinRosu
    (Meniu(mancare ?m)(vin rosu-sec))
    =>
    (printout t "meniul care merge cu vin rosu este: " ?m crlf)
)

(run)

(defrule vinTarie1
    (declare (salience ?*priorSlab*))
    ?men<-(Meniu {tarie == slab && vechime == nou}
        (vin ?name))
    =>
    (printout t "Vinurile recomandate prima data sunt: " ?name crlf)
)

(run)
(defrule Inceput1
    ?men<-(Meniu {vin == spumant}
        (vin ?name))
    =>
    (printout t "***Pentru inceput, daca vinul este " ?name " ,in continuare se poate servi toata gama de vinuri" crlf)
    )
(run)
(defrule Inceput2
    ?men<-(Meniu {vin == rosu-demisec}
        (vin ?name))
    =>
    (printout t "***Pentru inceput, daca vinul este: " ?name " ,in continuare nu se mai poate servi vin alb-sec" crlf)
    )
(run)
(defrule Inceput3
    ?men<-(Meniu {vin == rosu-dulce}
        (vin ?name))
    =>
    (printout t "***Pentru inceput, daca vinul este: " ?name " ,in continuare nu se mai poate servi vin alb-sec" crlf)
    )
(run)
(defrule Mijloc1
    ?men<-(Meniu {vin == alb-dulce || vin == alb-demidulce}
        (vin ?name))
    =>
    (printout t "In timpul pranzului ,daca vinul este: " ?name " ,in continuare nu se mai poate servi vin rosu" crlf)
    )
(run)
(defrule Mijloc2
    ?men<-(Meniu {vin == spumant}
        (vin ?name))
    =>
    (printout t "In timpul pranzului ,daca vinul este: " ?name ", iar inainte s-a servit nespumant, in continuare se serveste doar spumant" crlf)
    )
(run)
(defrule Sfarsit
    ?men<-(Meniu {vin == rosu-sec || vin == vinare}
        (vin ?name))
    =>
    (printout t "La sfarsitul pranzului ,se recomanda: " ?name  crlf)
    )

(run)