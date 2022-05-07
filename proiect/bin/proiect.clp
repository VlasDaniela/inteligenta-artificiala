(deftemplate Persoana (slot prenume)(slot nume)(multislot mama) (multislot tata) (multislot partener))


(deffacts Familie 
        (Persoana(prenume ion ) (nume popescu)(mama nil)(tata nil)(partener maria popescu)) 
        (Persoana(prenume maria) (nume popescu)(mama nil)(tata nil)(partener ion popescu))
        (Persoana (prenume cristian) (nume popescu)(mama maria popescu)(tata ion popescu)(partener elena popescu))
 		(Persoana(prenume adrian ) (nume popescu)(mama maria popescu)(tata ion popescu)(partener cristina popescu))
		(Persoana(prenume ciprian ) (nume popescu)(mama maria popescu)(tata ion popescu)(partener adriana popescu))
		(Persoana(prenume maria ) (nume andreescu)(mama nil)(tata nil)(partener petre andreescu))
		(Persoana(prenume ionel) (nume andreescu)(mama maria andreescu)(tata petre andreescu)(partener nil))
	    (Persoana(prenume tudor) (nume popescu)(tata adrian popescu)(mama cristina popescu)))
(reset)

(defrule regula2
    (Persoana(prenume ?x)(mama $?y){nume == popescu})
    =>
    (printout t $?y "este mama lui: " ?x crlf)
 )   
(facts)
(run)

(deffacts Familie 
        (Persoana(prenume ion ) (nume popescu)(mama nil)(tata nil)(partener maria popescu)) 
        (Persoana(prenume maria) (nume popescu)(mama nil)(tata nil)(partener ion popescu))
        (Persoana (prenume cristian) (nume popescu)(mama maria popescu)(tata ion popescu)(partener elena popescu))
 		(Persoana(prenume adrian ) (nume popescu)(mama maria popescu)(tata ion popescu)(partener cristina popescu))
		(Persoana(prenume ciprian ) (nume popescu)(mama maria popescu)(tata ion popescu)(partener adriana popescu))
		(Persoana(prenume maria ) (nume andreescu)(mama nil)(tata nil)(partener petre andreescu))
		(Persoana(prenume ionel) (nume andreescu)(mama maria andreescu)(tata petre andreescu)(partener nil))
	    (Persoana(prenume tudor) (nume popescu)(tata adrian popescu)(mama cristina popescu)))
(reset)


(defrule regula2
    (Persoana(prenume ?x)(mama $?y){nume == popescu})
    =>
    (printout t $?y "este mama lui: " ?x crlf)
 )   
(facts)
(run)