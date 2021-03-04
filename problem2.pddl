(define (problem Actividad-RPA-laboratorio) (:domain Ciudad)
(:objects 
    A1 - ambulancia
    L2 L3 L4 - localizacion
    L1 - hospital
    E1 E2 - enfermo
)

(:init
    ;todo: put the initial state's facts and numeric values here
    (ubicacion A1 L4)
    (enlace L1 L2)
    (enlace L2 L1)
    (enlace L2 L4)
    (enlace L4 L2)
    (enlace L4 L3)
    (enlace L3 L4)
    (ubicacion E1 L2)
    (ubicacion E2 L3)
    (vacia A1)
)

(:goal (and
    ;todo: put the goal condition here
    ;(ubicacion A1 L3)
    ;(not(vacia A1))
    (ubicacion E1 L1)
    (ubicacion E2 L1)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)