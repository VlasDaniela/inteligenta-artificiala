

(deftemplate combination 
    (slot letter) 
    (slot digit)
) ;declaram faptul ca asociem o cifra unei litere 
 
(foreach ?letter (create$ b a n g u v o r e)
    (foreach ?digit (create$ 1 2 3 4 0 5 6 7 8 9)
        (assert (combination (letter ?letter) (digit ?digit)))
        ) 
 ) ; cream cate un fact pentru fiecare pereche litera cifra
 
 
(defrule rule 
   
    (combination (letter b) (digit ?b){digit != 0}) ; verifica daca cifra e diferita de 0
    (combination (letter a) (digit ?a & ~?b){digit != 0}); verifica daca cifra e diferita de cifra de la litera de mai sus si diferita de 0
    (combination (letter n) (digit ?n & ~?b & ~?a)); verif daca cifra e dif de cifrele de la literele de mai sus
    (combination (letter g) (digit ?g & ~?b & ~?a & ~?n){digit != 0});..
    (combination (letter u) (digit ?u & ~?b & ~?a & ~?n & ~?g));..
    (combination (letter v) (digit ?v & ~?b & ~?a & ~?n & ~?g & ~?u));..
    (combination (letter o) (digit ?o & ~?b & ~?a & ~?n & ~?g & ~?u & ~?v){digit != 0});..
    (combination (letter r) (digit ?r & ~?b & ~?a & ~?n & ~?g & ~?u & ~?v & ~?o));..
	(combination (letter e) (digit ?e & ~?b & ~?a & ~?n & ~?g & ~?u & ~?v & ~?o & ~?r));..
        
 	(test (= (+(+(* 100000 ?b)(* 10000 ?a)(* 1000 ?n)(* 100 ?a)(* 10 ?n) ?a)
                (+(* 10000 ?g)(* 1000 ?u)(* 100 ?a)(* 10 ?v) ?a))
            (+(* 100000 ?o)(* 10000 ?r)(* 1000 ?a)(* 100 ?n)(* 10 ?g) ?e)));test pentru a verifica cerinta "BANANA"+ "GUAVA" = "ORANGE"
    =>
    ; afisari
    (printout t "BANANA=" ?b ?a ?n ?a ?n ?a  crlf)
    (printout t "GUAVA=" ?g ?u ?a ?v ?a crlf)
    (printout t "ORANGE=" ?o ?r ?a ?n ?g ?e crlf)
    (printout t "A+B+O+V+E=" (+ ?a ?b ?o ?v ?e) crlf);suma cand literele au cifre in functie de regula de mai sus 
    )

(run)