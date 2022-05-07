(deftemplate multimi
 
 (slot numeMultime) 
 (slot element1) 
 (slot element2) 
 (slot element3) 
 (slot element4) 
 
 ) 
(assert (multimi (numeMultime A) (element1 15) (element2 2) 
(element3 3) (element4 5))) 
(assert (multimi (numeMultime B) (element1 6) (element2 7) 
(element3 8) (element4 9))) 
(deftemplate multimeNoua
 
 (slot numeMultime) 
 (slot element1) 
 (slot element2) 
 (slot element3) 
 (slot element4) 
 (slot element5) 
 (slot element6) 
 (slot element7) 
 (slot element8) 
 
 ) 
(assert (multimeNoua (numeMultime AB) (element1 0) (element2 0) 
(element3 0) (element4 0) (element5 0) (element6 0) (element7
0) (element8 0))) 
(assert (multimeNoua (numeMultime AB2) (element1 0) (element2 0) 
(element3 0) (element4 0) (element5 0) (element6 0) (element7
0) (element8 0))) 
(deftemplate sumaElemente
 
 (slot suma) 
 
 ) 
(assert (sumaElemente (suma 0)))
(defrule suma1
 
 ?valM <- (multimi (numeMultime A) (element1 ?e1) (element2
?e2) (element3 ?e3) (element4 ?e4))
?valS <- (multimeNoua (element1 ?el1) (element2 ?el2) 
(element3 ?el3) (element4 ?el4))
 
 =>
 
 (modify ?valS (element1 (+ ?e1 ?el1)) (element2 (+ ?e2 
?el2)) (element3 (+ ?e3 ?el3)) (element4 (+ ?e4 ?el4))) 
 (retract ?valM) 
 
 ) 
(defrule suma2
 
 ?valM <- (multimi (numeMultime B) (element1 ?e1) (element2
?e2) (element3 ?e3) (element4 ?e4))
 ?valS <- (multimeNoua (element5 ?el5) (element6 ?el6) 
(element7 ?el7) (element8 ?el8)) 
 
 =>
 
 (modify ?valS (element5 (+ ?e1 ?el5)) (element6 (+ ?e2 
?el6)) (element7 (+ ?e3 ?el7)) (element8 (+ ?e4 ?el8))) 
 (retract ?valM) 
 
 ) 
(defrule afisareSuma
 
 (multimeNoua (numeMultime ?x) (element1 ?e1) (element2 ?e2) 
(element3 ?e3) (element4 ?e4) (element5 ?e5) (element6 ?e6) 
(element7 ?e7) (element8 ?e8))
 
 =>
 
 (printout t "Multimea rezultanta este: " ?x " ,avand 
elementele:" ?e1 "," ?e2 "," ?e3 "," ?e4 "," ?e5 "," ?e6 ","
?e7 "," ?e8 crlf) 
 
 ) 
(run) 
(defrule SumaElementeAB
    ?elAB <- (multimeNoua (numeMultime ?x) (element1 ?e1) 
(element2 ?e2) (element3 ?e3) (element4 ?e4) (element5 ?e5) 
(element6 ?e6) (element7 ?e7) (element8 ?e8) 
 {(element1 > 10 && element1 < 50) ||
  (element2 > 10 && element2 < 50) || 
  (element3 > 10 && element3 < 50) || 
  (element4 > 10 && element4 < 50) || 
  (element5 > 10 && element5 < 50) || 
  (element6 > 10 && element6 < 50) || 
  (element7 > 10 && element7 < 50) ||
  (element8 > 10 && element8 < 50)})
 
 ?sumaEL <- (sumaElemente (suma ?suma))
 
 =>
 
 (modify ?sumaEL (suma (+ ?e1 ?e2 ?e3 ?e4 ?e5 ?e6 ?e7 ?e8 
?suma)))
 (retract ?elAB) 
 
 ) 
(defrule AfisareSumaElemente
 
 (sumaElemente (suma ?suma))
 
 =>
 
 (printout t "Suma elementelor din multime este:" ?suma
crlf) 
 
 ) 
(run)