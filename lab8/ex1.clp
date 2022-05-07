(defglobal ?*TASK_PRIORITY_1* = 2)

(deftemplate flight
    (multislot start)
    (multislot stop)
    (slot distance)
)

(assert (flight (start New York) (stop Chicago) (distance 831.3)))
(assert (flight (start New York) (stop Oklahoma) (distance 700)))
(assert (flight (start Canada) (stop Germania) (distance 700)))

(defrule startFromNewYork
    ?var<-(flight (start $? New York $?) (stop $?X))
    
    =>

    (printout t ?var.start " - " ?var.stop crlf)
    
)

(defrule atLeast
    (declare (salience ?*TASK_PRIORITY_1*))
    ?var<-(flight (start $?X) (stop $?Y) (distance $?Z))
    
    =>
    
        (if (and (< ?var.distance 2200 ) (> ?var.distance 800)) then 
        	(printout t ?var.start " - " ?var.stop " - " ?var.distance crlf)
	)
    
)


;(facts)
(run)