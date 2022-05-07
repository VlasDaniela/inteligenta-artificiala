(deftemplate numeStare
 
 (slot nume) 
 
 )
(deftemplate relatie
 
 (slot monezi) 
 (slot stare1) 
 (slot stare2) 
 
 )
(deftemplate functionareAparat
 
 (slot stareCurenta) 
 (slot moneda) 
 
 ) 
(deftemplate ControlExecutie
 
 (slot intrebare) 
 (slot raspuns) 
 
 )
(assert (numeStare (nume start))) 
(assert (numeStare (nume 5))) 
(assert (numeStare (nume 10))) 
(assert (numeStare (nume 15))) 
(assert (numeStare (nume 20))) 
(assert (numeStare (nume 25))) 
(assert (numeStare (nume 30))) 
(assert (numeStare (nume 35))) 
(assert (numeStare (nume 40))) 
(assert (numeStare (nume 45))) 
(assert (numeStare (nume 50))) 
(assert (numeStare (nume succes))) 

(assert (relatie (monezi N) (stare1 start) (stare2 5))) 
(assert (relatie (monezi Q) (stare1 start) (stare2 25))) 
(assert (relatie (monezi N) (stare1 5) (stare2 10)))
(assert (relatie (monezi Q) (stare1 5) (stare2 30)))
(assert (relatie (monezi N) (stare1 10) (stare2 15))) 
(assert (relatie (monezi Q) (stare1 10) (stare2 35))) 
(assert (relatie (monezi N) (stare1 15) (stare2 20))) 
(assert (relatie (monezi Q) (stare1 15) (stare2 40))) 
(assert (relatie (monezi N) (stare1 20) (stare2 25))) 
(assert (relatie (monezi Q) (stare1 20) (stare2 45))) 
(assert (relatie (monezi N) (stare1 25) (stare2 30))) 
(assert (relatie (monezi Q) (stare1 25) (stare2 50))) 
(assert (relatie (monezi N) (stare1 30) (stare2 35))) 
(assert (relatie (monezi Q) (stare1 30) (stare2 succes))) 
(assert (relatie (monezi N) (stare1 35) (stare2 40))) 
(assert (relatie (monezi Q) (stare1 35) (stare2 succes))) 
(assert (relatie (monezi N) (stare1 40) (stare2 45))) 
(assert (relatie (monezi Q) (stare1 40) (stare2 succes))) 
(assert (relatie (monezi N) (stare1 45) (stare2 50))) 
(assert (relatie (monezi Q) (stare1 45) (stare2 succes))) 
(assert (relatie (monezi N) (stare1 50) (stare2 succes))) 
(assert (relatie (monezi Q) (stare1 50) (stare2 succes)))

(facts)

(assert (functionareAparat (stareCurenta nil) (moneda nil))) 
(defrule Faza1
 
 (functionareAparat (stareCurenta nil) (moneda nil))
 
 =>
 (printout t "Introduceti o moneda: 5 sau 25 centi" crlf) 
 (bind ?m (read))
 (assert (functionareAparat (stareCurenta start) (moneda
?m))) 
 
 ) 
(defrule Faza2
 
 (functionareAparat (stareCurenta 5) (moneda 5))
 
 =>
 
 (printout t "Introduceti inca o moneda in valoare de: 5 sau 
25 centi" crlf) 
 (bind ?m (read))
    (assert (functionareAparat (stareCurenta 5) (moneda ?m))) 
 
 ) 
(defrule Intrebare1
 
 (ControlExecutie (intrebare nil) (raspuns nil))
 
 =>
 
 (printout t "Resetare sistem ? (DA/NU)" crlf) 
 (bind ?r (read))
 (assert (ControlExecutie (intrebare "Resetare sistem") 
(raspuns ?r))) 
 
 ) 
(defrule Control1
 
 (ControlExecutie (intrebare "Resetare sistem ?") (raspuns 
DA))
 (functionareAparat (stareCurenta start) (moneda nil))
 
 =>
 
 (printout t "Sistemul a fost resetat!" crlf) 
 (printout t "Introduceti o moneda in valoare de: 5 sau 25 
centi" crlf) 
 (bind ?m (read))
 (assert (functionareAparat (stareCurenta start) (moneda
?m))) 
 
 ) 
(defrule Control2
 
 (ControlExecutie (intrebare "Resetare sistem ?") (raspuns 
NU))
 
 =>
 
 (printout t "Sistemul va continua procesul de producere al 
cafelei" crlf) 
 
 
 )
(defrule Faza3
 
 (functionareAparat (stareCurenta 25) (moneda 25))
 
 =>
 
 (printout t "Introduceti inca o moneda in valoare de: 5 sau 
25 centi" crlf) 
 (bind ?m (read))
 (assert (functionareAparat (stareCurenta 25) (moneda ?m))) 
 
 ) 
(defrule Faza4
 
 (functionareAparat (stareCurenta 10) (moneda 5))
 
 =>
 
 (printout t "Introduceti inca o moneda in valoare de: 5 sau 
25 centi" crlf) 
 (bind ?m (read))
 (assert (functionareAparat (stareCurenta 10) (moneda ?m))) 
 
 ) 
(defrule Faza5
 
 (functionareAparat (stareCurenta 50) (moneda 25))
 
 =>
 
 (printout t "Introduceti inca o moneda in valoare de: 5 sau 
25 centi" crlf) 
 (bind ?m (read))
 (assert (functionareAparat (stareCurenta 50) (moneda ?m))) 
 
 ) 
(defrule Faza6
 
 (functionareAparat (stareCurenta 15) (moneda 5))
 
 =>
(printout t "Introduceti inca o moneda in valoare de: 5 sau 
25 centi" crlf) 
 (bind ?m (read))
 (assert (functionareAparat (stareCurenta 15) (moneda ?m))) 
 
 ) 
(defrule Incheiere1
 
 (functionareAparat (stareCurenta 55) (moneda 5))
 
 =>
 
 (printout t "Cafeaua a fost platita !" crlf) 
 
 ) 
(defrule Faza8
 
 (functionareAparat (stareCurenta 20) (moneda 5))
 
 =>
 
 (printout t "Introduceti inca o moneda in valoare de: 5 sau 
25 centi" crlf) 
 (bind ?m (read))
 (assert (functionareAparat (stareCurenta 20) (moneda ?m))) 
 
 ) 
(run) 

