(deftemplate combination (slot letter)(slot number))


(foreach ?x (create$ B U L D O G S P E T)
    (foreach ?y (create$ 0 1 2 3 4 5 6 7 8 9)
        (assert (combination (letter ?x)(number ?y)
                ))))


(defrule find-solution
    (combination (letter B)(number ?b&: (= 1 ?b)))
    (combination (letter U)(number ?o&: (= 0 ?o)))
    (combination (letter L)(number ?s&: (= 9 ?s)))
    (combination (letter D)(number ?d&~?b&~?o&~?s&))
    (combination (letter O)(number ?e&~?d&~?b&~?o&~?s&))
    (combination (letter G)(number ?y&~?e&~?d&~?b&~?o&~?s&: (= (mod (+ ?d ?e) 10) ?y)))
    (combination (letter S)(number ?n&~?y&~?e&~?d&~?b&~?o&~?s& :(= (+ ?e 1) ?n)))

    
    =>
    (printout t "A solution is: " crlf)
    (printout t " B = " ?s)
    (printout t " U = " ?e)
    (printout t " L = " ?n)
    (printout t " D = " ?d)
    (printout t " O = " ?m)
    (printout t " G = " ?o)
    (printout t " S = " ?y)
    
    (printout t crlf)
    (printout t "   " ?s ?e ?n ?d crlf)
    (printout t " + " ?m ?o ?e crlf)
    (printout t "   " "-----" crlf)
    (printout t " = " ?m ?o ?n ?e ?y crlf)
    
    )

;z, o si b nu pot fi 0
; daca s = 6
;putem folosi t

;ne facem template
;sa gasim in baza de cunostinte o combinatie care are litera etc... si sa fie diferite de celelalte precedente gasite in baza de cunostinte
;daca e la inceput sa fie diferit de 0

(run)