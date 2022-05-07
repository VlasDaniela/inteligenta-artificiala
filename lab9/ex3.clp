(deftemplate relat 
    (slot mode(type STRING))
    (slot son(type STRING))
    (slot parent(type STRING))
    
)

(assert (relat (mode "ako")(son "ballon")(parent "aircraft")))
(assert (relat (mode "ako")(son "pr.driven")(parent "aircraft")))
(assert (relat (mode "ako")(son "jet")(parent "aircraft")))
(assert (relat (mode "ako")(son "blimp")(parent "ballon")))
(assert (relat (mode "ako")(son "blimp")(parent "pr.driven")))
(assert (relat (mode "ako")(son "special")(parent "pr.driven")))
(assert (relat (mode "ako")(son "dc-3")(parent "pr.driven")))
(assert (relat (mode "ako")(son "dc-9")(parent "jet")))
(assert (relat (mode "ako")(son "concorde")(parent "jet")))
(assert (relat (mode "has-shape")(son "ballon")(parent "round")))
(assert (relat (mode "has-shape")(son "blimp")(parent "ellips.")))
(assert (relat (mode "is-a")(son "good year")(parent "blimp")))
(assert (relat (mode "is-a")(son "spirit of stl")(parent "special")))
(assert (relat (mode "is-a")(son "airforce 1")(parent "dc-9")))


(defrule cauta-solutie-is-a

    (declare (salience 1000))    
    (relat(son ?a))
    ?m <-(relat (mode "is-a")(son ?a)(parent ?q))
    ?n <-(relat (mode "ako")(son ?q)(parent ?p))
    =>
    (assert (relat (parent ?p)))
    (retract ?m ?n)
    (printout t $?m $?n crlf)
)


(run)