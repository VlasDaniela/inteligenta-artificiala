(deftemplate transfer (slot grupa)(multislot accepta))
(assert (transfer (grupa O) (accepta O)))
(assert (transfer (grupa A) (accepta A O))
(assert (transfer (grupa B) (accepta B O))
(assert (transfer (grupa AB) (accepta A B O)))

(deftemplate pacient (slot grupa)(slot transfer ))

(defrule poate-transfera
(pacient (grupa ?g) (transfer ?t))
(transfer (grupa ?g) (accepta $? ?t $?))
=>
(printout t "Transferul se poate realiza!" crlf)
)
        (run)
