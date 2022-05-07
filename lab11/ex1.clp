(deftemplate triunghi
	(slot tip)
    (multislot coordonate)   
)

(assert(triunghi(tip oarecare) (coordonate 2 7 7 2 2 5)))
(assert(triunghi(tip oarecare) (coordonate 3 4 2 5 1 6)))
(assert(triunghi(tip oarecare) (coordonate 5 0 -2 4 2 -2)))
(assert(triunghi(tip oarecare) (coordonate 0 0 3 3 3 3)))

(deffunction det_tip($?coordonate)
    
    (bind ?x1 (nth$ 1 $?coordonate))
    (bind ?y1 (nth$ 2 $?coordonate))
    (bind ?x2 (nth$ 3 $?coordonate))
    (bind ?y2 (nth$ 4 $?coordonate))
    (bind ?x3 (nth$ 5 $?coordonate))
    (bind ?y3 (nth$ 6 $?coordonate))
    
    (bind ?d1 (sqrt (+ (* (- ?x1 ?x2) (- ?x1 ?x2))(* (- ?y1 ?y2) (- ?y1 ?y2))) ) )
    (bind ?d2 (sqrt (+ (* (- ?x1 ?x3) (- ?x1 ?x3))(* (- ?y1 ?y3) (- ?y1 ?y3))) ) )
    (bind ?d3 (sqrt (+ (* (- ?x3 ?x2) (- ?x3 ?x2))(* (- ?y3 ?y2) (- ?y3 ?y2))) ) )
    
    (if (or (and (= ?x1 ?x2) (= ?y1 ?y2)) (and (= ?x1 ?x3) (= ?y1 ?y3) ) (and (= ?x3 ?x2) (= ?y3 ?y2) )  ) then
        (return nu_este_triunghi)
     )
    
    (if (or (= (* ?d1 ?d1)(+ (* ?d2 ?d2) (* ?d3 ?d3)) ) (= (* ?d2 ?d2)(+ (* ?d1 ?d1) (* ?d3 ?d3)) ) (= (* ?d3 ?d3)(+ (* ?d2 ?d2) (* ?d1 ?d1)) ) )
        then
        
        (return dreptunghic)
    )
    
    (if (= ?d1 ?d2 ?d3) then
    	(return echilateral)
    )
    
    (if (or (= ?d1 ?d2) (= ?d1 ?d3) (= ?d2 ?d3)) then
        (return isoscel)
    )
    
    (return oarecare)
)


(defrule rule1
    ?obj<-(triunghi (coordonate $?c))
    =>
    (bind ?tip (det_tip $?c))
    (printout t ?tip " " ?c crlf)
    (retract ?obj)
)

(run)
