(deftemplate pers
    (slot nume)
    (slot ochi)
    (slot par)
    (slot nat)
    )
 (deftemplate person
    (slot name)
    (slot eye-color)
    (slot hair-color)
    (slot nationality)
    )
(deffacts LUME 
    (pers (nume Ion)(ochi verzi)(par negru)(nat Romania))
    (pers (nume Cindi)(ochi albastri)(par blond)(nat Suedia))
    (pers (nume Kerim)(ochi negri)(par alb)(nat Fanta))
    (pers (nume Harry)(ochi verzi)(par saten)(nat Fanta))
    (pers (nume Mihai)(ochi verzi)(par saten)(nat Fanta))
    (pers (nume Ivan)(ochi albastri)(par negru)(nat Fanta))
    (pers (nume Vasile)(ochi albi)(par violet)(nat US))   
    (person (name Cindi)(eye-color albastri)(hair-color negru)(nationality Suedia))
    (person (name Kerim)(eye-color caprui)(hair-color alb)(nationality Fanta))
    )
 
(defrule inFanta
    ?p <- (pers (nume ?nume)(ochi verzi)(par saten)(nat Fanta))
    =>
    (printout t ?p.nume "b" crlf)
    )
 
(defrule rule2
    ?p <- (pers (nume ?nume)(ochi ?ochi & ~albastri)(par ?par & ~negru))
    (not (pers (nume ?nume2 & ~?nume)(ochi ?ochi)))
    (not (pers (nume ?nume3 & ~?nume)(par ?par)))
    =>
    (printout t ?p.nume "a"crlf)
    )
 
(defrule ruleperson
    ?p <- (person (name ?nume)(eye-color ?ochi)(hair-color ?par)(nationality ?nat))
    (test (and (person (hair-color ?par & ~maro)(hair-color ?par & ~negru))))
    (and (person (eye-color ?ochi2 & ~caprui)))
    (not (person (nationality ?nat2 & ~?nat)))
    =>
    (printout t ?p.nume crlf)
    )
(defrule person-rule
    (person {hair-color == "maro" || hair-color == "negru"} (nationality ?nat1) (name ?name1))
    (person {eye-color == "caprui"} (nationality ?nat2) (name ?name2))
    =>
    (printout t ?name1 " si " ?name2 crlf)
    )
 
(reset)
(run)