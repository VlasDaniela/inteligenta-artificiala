(defglobal ?*TASK_PRIORITY_1* = 2)
(deftemplate Pacient
(slot numar)
(slot temperatura)
(slot tusa)
(slot culoarePiele)
)
(assert (Pacient (numar 1)(temperatura 37.6) (tusa da) (culoarePiele alb)))
(assert (Pacient (numar 2)(temperatura 36) (tusa nu) (culoarePiele negru)))
(assert (Pacient (numar 3)(temperatura 35) (tusa da) (culoarePiele galben)))
(assert (Pacient (numar 4)(temperatura 37) (tusa da) (culoarePiele albSpreNegru)))

(defrule boala1 
    (declare (salience ?*TASK_PRIORITY_1*))
    (Pacient (numar $?x) {tusa == da && culoarePiele == galben})
    =>
    (printout t $?x " Aproape mori" crlf)
    )
(defrule boala2

    (Pacient (numar $?x) {temperatura > 36 && tusa == da})
    =>
    (printout t $?x " Mai apuci 2,3 zile" crlf)
    )
(defrule boala3

    (Pacient (numar $?x) {temperatura >= 36 && culoarePiele == negru})
    =>
    (printout t $?x " esti negru de bolnav" crlf)
    )
(run)