(deftemplate senzor (multislot stare)(multislot moment (type NUMBER)) (slot
nume))
(deffacts momentul1 
 (senzor (nume senzor1) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK notOK OK OK OK OK notOK OK notOK OK OK OK ))
 (senzor (nume senzor2) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare notOK OK notOK OK notOK OK notOK OK notOK OK notOK OK ))
 (senzor (nume senzor3) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK notOK OK OK notOK OK OK notOK OK OK notOK OK))
 (senzor (nume senzor4) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare notOK notOK notOK notOK notOK OK OK OK OK OK OK OK)) 
 (senzor (nume senzor5) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK OK OK OK OK notOK notOK notOK notOK notOK notOK notOK))
 (senzor (nume senzor6) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK OK OK OK OK OK OK OK OK OK OK OK))
 (senzor (nume senzor7) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK notOK OK notOK OK OK OK notOK OK OK OK notOK))
 (senzor (nume senzor8) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK notOK OK OK OK notOK notOK notOK OK OK OK OK))
 (senzor (nume senzor9) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK notOK notOK OK OK OK OK notOK OK notOK OK OK))
 (senzor (nume senzor0) (moment 1 2 3 4 5 6 7 8 9 10 11 12) 
 (stare OK notOK notOK OK OK OK OK notOK OK OK OK OK)))
(deffacts aux 
 (contor 0) ;numarul de stari notOK
 (curent 1) ;momentul curent
 ) 
(defrule contor ;numare starile notOK
 (declare (salience 500))
?l <- (contor ?p) 
 (curent ?m) 
?k <- (senzor (nume ?a) (moment ?m $?mm) (stare notOK $?ss))
 =>
 (retract ?l ?k) 
 (assert (contor (+ 1 ?p)))
 (assert (senzor (nume ?a) (moment $?mm) (stare $?ss))))
(defrule verde ;pune pe verde
 (declare (salience 100))
    (contor ?p) 
 (curent ?m) 
 (test (> 3 ?p))
 =>
 (assert (stare ?m verde)))
(defrule galben ;pune pe galben
 (declare (salience 200))
 (contor ?p) 
 (curent ?m) 
 (test (and (> ?p 2) (< ?p 7)))
 =>
 (assert (stare ?m galben)))
(defrule rosu-daca-sunt-prea-multe-galbene
 (declare (salience 199))
 (curent ?m) 
 (stare ?o&:(= ?o (- ?m 1)) galben) 
 (stare ?i&:(= ?i (- ?m 2)) galben) 
?ss <- (stare ?m galben) 
 =>
 (retract ?ss) 
 (assert (stare ?m rosu)))
(defrule rosu ;pune pe rosu
 (declare (salience 300))
 (contor ?p) 
 (curent ?m) 
 (test (> ?p 6))
 =>
 (assert (stare ?m rosu)))
(defrule schimba-momenul-senzorilor
 (declare (salience -999))
 (curent ?m) 
?ss <- (senzor (nume ?a) (moment ?m $?mm) (stare OK $?s))
 =>
 (retract ?ss) 
 (assert (senzor (nume ?a) (moment $?mm) (stare $?s))))
(defrule momentul-urmator
 (declare (salience -1000))
?cc <- (contor ?c) 
?rr <- (curent ?r) 
 (test (> 13 ?r))
 =>
 (retract ?cc ?rr) 
 (assert (contor 0) 
 (curent (+ 1 ?r))))


(reset)
(facts)

(run)