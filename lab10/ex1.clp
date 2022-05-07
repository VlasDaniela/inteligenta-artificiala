(deftemplate combination 
    (slot color (type STRING))
    (slot country (type STRING))
)

(defrule startup

    =>
    (assert (color red)
        (color blue)
        (color yellow)
        (color green)
        (country Ukraina)
        (country Moldova)
        (country Bulgaria)
        (country Romania)
    )
)

(defrule generate-combinations



    (color ?c)
    (country ?a)
    =>
    (assert (combination (country ?a)(color ?c)))
)

(defrule solve



    (combination (country Romania)(color ?RO & : (= red ?RO)))
    (combination (country Moldova)(color ?MD & ~?RO))
    (combination (country Bulgaria)(color ?BG & ~?RO))
    (combination (country Ukraina)(color ?UA & ~?MD & ~?RO))
    
    
    => 
    (printout t " Se gaseste solutia: ")
    (printout t " Romania = " ?RO)
    (printout t " Moldova = " ?MD)
    (printout t " Bulgaria = " ?BG)
    (printout t " Ukraina = " ?UA crlf)
    
)

(reset)
(run)