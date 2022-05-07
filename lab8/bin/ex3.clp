(defglobal ?*TASK_PRIORITY_1* = 2)
(deftemplate elev
	(slot numar)
    (slot nota1)
    (slot nota2)
    (slot nota3)
    (slot nota4)
)
(assert (elev (numar 1) (nota1 8) (nota2 9) (nota3 10) (nota4 7) ))
(assert (elev (numar 2) (nota1 7) (nota2 6) (nota3 10) (nota4 6) ))
(assert (elev (numar 3) (nota1 10) (nota2 8) (nota3 9) (nota4 9) ))
(assert (elev (numar 4) (nota1 6) (nota2 4) (nota3 8) (nota4 6) ))
(assert (elev (numar 5) (nota1 9) (nota2 10) (nota3 7) (nota4 8) ))
(assert (elev (numar 6) (nota1 10) (nota2 10) (nota3 10) (nota4 10) ))

(defrule rule1

    (declare (salience ?*TASK_PRIORITY_1*))
    (elev (numar $?x) {nota1 >= 8 && nota2 >= 9 && nota3 >= 9} )
    =>
    (printout t $?x " Facultatea de matematica si informatica"crlf)
    )
(defrule rule2

    (elev (numar $?x) {nota1 >= 6 && nota4 >= 4 && nota3 >= 5} )
    =>
    (printout t $?x " Facultatea de sport"crlf)
    )
(defrule rule3

    (elev (numar $?x) {nota1 >= 5 && nota2 >= 6  && nota3 >= 5 && nota4 >= 7 } )
    =>
    (printout t $?x " Facultatea de drept"crlf)
    )
(run)