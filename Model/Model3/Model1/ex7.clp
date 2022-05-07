(deftemplate retea
 
 (slot relatie) 
 (slot atribut1) 
 (slot atribut2)
    ) 
(assert (retea (atribut1 GoodYear) (relatie IS-A) (atribut2 
Blimp)))
(assert (retea (atribut1 Blimp) (relatie Has-shape) (atribut2 
Ellips))) 
(assert (retea (atribut1 Blimp) (relatie AKO) (atribut2 
Pr.driven))) 
(assert (retea (atribut1 Blimp) (relatie AKO) (atribut2 
Ballon))) 
(assert (retea (atribut1 Ballon) (relatie Has-shape) (atribut2 
Round)))
(assert (retea (atribut1 Ballon) (relatie AKO) (atribut2 
Aircraft))) 
(assert (retea (atribut1 SpiritOfStl) (relatie IS-A) (atribut2 
Special))) 
(assert (retea (atribut1 Special) (relatie AKO) (atribut2 
Pr.driven))) 
(assert (retea (atribut1 Pr.driven) (relatie AKO) (atribut2 
Aircraft))) 
(assert (retea (atribut1 DC-3) (relatie AKO) (atribut2 
Pr.driven))) 
(assert (retea (atribut1 Airforce1) (relatie IS-A) (atribut2 
DC-9))) 
(assert (retea (atribut1 DC-9) (relatie AKO) (atribut2 Jet))) 
(assert (retea (atribut1 Concorde) (relatie AKO) (atribut2 
Jet))) 
(facts) 
(defrule AKO
 
 (retea (atribut1 ?x)(atribut2 ?y)(relatie ?z) {relatie == 
AKO})
    =>
 
 (printout t "Atributele " "(" ?x "," ?y ")" "sunt in 
relatia " ?z crlf) 
 
 ) 
(run) 
(defrule IS-A
 
 (retea (atribut1 ?x)(atribut2 ?y)(relatie ?z) {relatie == 
IS-A})
 
 =>
 
 (printout t "Atributele " "(" ?x "," ?y ")" "sunt in 
relatia " ?z crlf) 
 
 ) 
(run) 
(defrule Has-shape
 
 (retea (atribut1 ?x)(atribut2 ?y)(relatie ?z) {relatie == 
Has-shape})
 
 =>
 
 (printout t "Atributele " "(" ?x "," ?y ")" "sunt in 
relatia " ?z crlf) 
 
 ) 
(run)