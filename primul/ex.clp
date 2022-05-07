(deftemplate combination (slot letter) (slot digit)) ; definim un tip de fact pentru a asocia o litera cu o cifra
 
(foreach ?letter (create$ k a n s o h i r e g)
    (foreach ?digit (create$ 1 2 3 4 0 5 6 7 8 9)
        (assert (combination (letter ?letter) (digit ?digit)))
        ) 
 ) ; cream cate un fact pentru fiecare pereche litera cifra
 
 
(defrule rule ; primele combinations se asigura ca toate cifrele difera
    (combination (letter k) (digit ?k))
    (combination (letter a) (digit ?a & ~?k))
    (combination (letter n) (digit ?n & ~?k & ~?a))
    (combination (letter s) (digit ?s & ~?k & ~?a & ~?n))
    (combination (letter o) (digit ?o & ~?s & ~?k & ~?a & ~?n))
    (combination (letter h) (digit ?h & ~?o & ~?s & ~?k & ~?a & ~?n))
    (combination (letter i) (digit ?i & ~?h & ~?o & ~?s & ~?k & ~?a & ~?n))
    (combination (letter r) (digit ?r & ~?i & ~?h & ~?o & ~?s & ~?k & ~?a & ~?n))
    (combination (letter e) (digit ?e & ~?r & ~?i & ~?h & ~?o & ~?s & ~?k & ~?a & ~?n))
    (combination (letter g) (digit ?g & ~?e & ~?r & ~?i & ~?h & ~?o & ~?s & ~?k & ~?a & ~?n))

    ; se refac numerele si se verifica suma pentru cifrele distincte gasite    
    (test (= (+(+(* 100000 ?k)(* 10000 ?a)(* 1000 ?n)(* 100 ?s)(* 10 ?a) ?s)
                (+(* 1000 ?o)(* 100 ?h)(* 10 ?i) ?o))
            (+(* 100000 ?o)(* 10000 ?r)(* 1000 ?e)(* 100 ?g)(* 10 ?o) ?n)))
  
    =>
    ; afisare
    (printout t "KANSAS=" ?k ?a ?n ?s ?a ?s crlf)
    (printout t "OHIO=" ?o ?h ?i ?o crlf)
    (printout t "OREGON=" ?o ?r ?e ?g ?o ?n crlf)
    (printout t "G+R+O+S+S=" (+ ?g ?r ?o ?s ?s) crlf)
    )
 
(run)
