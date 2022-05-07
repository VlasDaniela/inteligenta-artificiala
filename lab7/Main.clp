(deftemplate persoana

    (multislot nume)
    (multislot mama)
    (multislot tata)
    (multislot partener)
)

(assert (persoana(nume ion popescu)(mama Daniela Popescu)(tata Ion Popescu)(partener maria popescu)))
(assert (persoana(nume dan popescu)(mama Daniela Popescu)(tata Ion Popescu)(partener nil)))
(assert (persoana(nume maria popescu)(mama Ionela X)(tata Georgel Y)(partener ion popescu)))
(assert (persoana(nume ioana X)(mama Ionela X)(tata Georgel Y)(partener nil)))
(assert (persoana(nume cristian popescu)(mama maria popescu)(tata ion popescu)(partener elena popescu)))
(assert (persoana(nume adrian popescu)(mama maria popescu)(tata ion popescu)(partener cristina popescu)))
(assert (persoana(nume ciprian popescu)(mama maria popescu)(tata ion popescu)(partener adriana popescu)))
(assert (persoana(nume maria andreescu)(mama maria popescu)(tata ion popescu)(partener petre andreescu)))
(assert (persoana(nume petre andreescu)(mama georgica andreescu)(tata george andreescu)(partener maria andreescu)))
(assert (persoana(nume ionel andreescu)(mama maria andreescu)(tata petre andreescu)(partener nil)))
(assert (persoana(nume tudor popescu)(tata adrian popescu)(mama cristina popescu)))


(defrule rule1

    ?var<-(persoana (nume $?Y) (tata $? ion popescu $?))
    =>
    (printout t "Nume: " ?var.nume crlf)
)

(defrule findNephewAndGrandpa
    (persoana (nume $?X) (mama $?A) (tata $?B))
    (persoana (nume $?A) (mama $?C) (tata $?D))
    (persoana (nume $?B) (mama $?E) (tata $?F))
    
    =>
    
    (printout t "Nepot: " $?X "   " $?C $?D $?E $?F crlf)
)

(defrule brother

    
    ?var1<-(persoana (nume $?X) (mama $?A) (tata $?B))
    ?var2<-(persoana (nume $?Y) (mama $?A) (tata $?B))
    
    =>
    	(if (neq $?X $?Y) then 
        	(printout t "FRATE: " $?X "-" $?Y crlf)(retract ?var1)
        	
        	
        )
)

(defrule print

    
    (persoana (nume $?X) (mama $?M) (tata $?T))
    (persoana (nume $?M) (mama $?A) (tata $?B))
    (persoana (nume $?SM) (mama $?A) (tata $?B))
	(persoana (nume $?T) (mama $?C) (tata $?D))
    (persoana (nume $?ST) (mama $?C) (tata $?D))
    
    =>
    (if (and (neq $?M $?SM) (neq $?T $?ST)) then 
        (printout t "Nepot: " $?X " Unchi/Matusa" $?SM $?ST $?M $?T crlf)
	)
 
)



;(facts)
(run)
