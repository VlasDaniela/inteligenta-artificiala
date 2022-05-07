(deftemplate element

	(slot elem)
	(slot val)
)

(assert (element (elem A) (val 2)))
(assert (element (elem B) (val 3)))
(assert (element (elem C) (val 7)))
(assert (element (elem D) (val 1001)))


(deftemplate suma
    (slot val)
)

(assert (suma (val 0)))

(defrule add
    ?var<-(element (elem ?X))
    ?varSum<-(suma (val ?v))
    
   	=>
    (printout t ?var.val crlf)
    (modify ?varSum(val (+ ?var.val ?v)))
    (retract ?var)
)

(defrule printSum
    ?varSum<-(suma (val ?v))
    
    =>
    
    (printout t "Suma: " ?v crlf)
)

;TEMA - EX 2 SI 4


(run)