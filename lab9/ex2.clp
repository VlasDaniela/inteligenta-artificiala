(deftemplate Dama (slot x)(slot y)(slot used(allowed-values TRUE FALSE)))

(foreach ?x (create$ 1 2 3 4)
    (foreach ?y (create$ 1 2 3 4)
        (assert (Dama (x ?x)(y ?y)(used FALSE)
                ))))

(defrule rzolvare 

    ?id1<- (Dama (x ?x1)(y ?y1)(used FALSE))
    ?id2<- (Dama (x ?x2 & ~?x1)(y ?y2 & ~?y1)(used FALSE))
    ?id3<- (Dama (x ?x3 & ~?x2 & ~?x1)(y ?y3 & ~?y2 & ~?y1)(used FALSE))
    ?id4<- (Dama (x ?x4 & ~?x3 & ~?x2 & ~?x1)(y ?y4 & ~?y3 & ~?y2 & ~?y1)(used FALSE))
    (test (neq (abs (- ?x1 ?x2)) (abs (- ?y1 ?y2))))
    (test (neq (abs (- ?x1 ?x3)) (abs (- ?y1 ?y3))))
    (test (neq (abs (- ?x1 ?x4)) (abs (- ?y1 ?y4))))
    (test (neq (abs (- ?x2 ?x3)) (abs (- ?y2 ?y3))))
    (test (neq (abs (- ?x2 ?x4)) (abs (- ?y2 ?y4))))
    (test (neq (abs (- ?x3 ?x4)) (abs (- ?y3 ?y4))))
    
    =>
    (printout t "Dama1 : x1 " ?x1 " y1 " ?y1 crlf)
    (printout t "Dama2 : x2 " ?x1 " y2 " ?y1 crlf)
    (printout t "Dama3 : x3 " ?x1 " y3 " ?y1 crlf)
    (printout t "Dama4 : x4 " ?x1 " y4 " ?y1 crlf)
    (modify ?id1 (used TRUE))
    (modify ?id2 (used TRUE))
    (modify ?id3 (used TRUE))
    (modify ?id4 (used TRUE))
    
    )

(run)