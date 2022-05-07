(deftemplate questions
	(slot question)
    (slot answer (allowed-values YES NO nil))    
)

(assert (questions (question nil) (answer nil)))

(defrule rule1

	?aux <- (questions (question nil) (answer nil))
    =>
    (printout t "Is it very big?")
    (bind ?x (read))
    (assert (questions (question "Is it very big?") (answer ?x)))
)

(defrule rule2.1

	?aux <- (questions (question "Is it very big?") (answer NO))
    =>
    (printout t "Does it squeak?")
    (bind ?x (read))
    (assert (questions (question "Does it squeak?") (answer ?x)))
)

(run)

