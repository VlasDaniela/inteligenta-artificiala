(deftemplate combination 
    (slot letter) 
    (slot digit)
) ;declaram faptul ca asociem o cifra unei litere 
 
(foreach ?letter (create$ t w o f u r )
    (foreach ?digit (create$ 1 2 3 4 0 5 6 7 8 9)
        (assert (combination (letter ?letter) (digit ?digit)))
        ) 
 ) ; cream cate un fact pentru fiecare pereche litera cifra
 
 
(defrule rule 
   
    (combination (letter t) (digit ?t)) ; 
    (combination (letter w) (digit ?w & ~?t)); verifica daca cifra e diferita de cifra de la litera de mai sus 
    (combination (letter o) (digit ?o & ~?w & ~?t)); verif daca cifra e dif de cifrele de la literele de mai sus
    (combination (letter f) (digit ?f & ~?o & ~?w & ~?t))
    (combination (letter u) (digit ?u & ~?f & ~?o & ~?w & ~?t))
    (combination (letter r) (digit ?r & ~?u & ~?f & ~?o & ~?w & ~?t))
    
        (test (= (+(+(* 100 ?t)(* 10 ?w) ?o)
                (+(* 100 ?t)(* 10 ?w) ?o))
            (+(* 1000 ?f)(* 100 ?o)(* 10 ?u) ?r)));test pentru a verifica cerinta "SEND"+ "MORE" = "MONEY"
    =>
    ; afisari
    (printout t "TWO=" ?t ?w ?o   crlf)
    (printout t "TWO=" ?t ?w ?o  crlf)
    (printout t "FOUR=" ?f ?o ?u ?r  crlf)
    
    )

(run)