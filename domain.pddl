;Header and description

(define (domain Ciudad)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

(:types ;todo: enumerate types and their hierarchy here, e.g. car truck bus - vehicle
    localizacion elemento - object
    hospital - localizacion
    ambulancia enfermo - elemento
)

; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (enlace ?l1 - localizacion ?l2 - localizacion)
    (ubicacion ?a - elemento ?l - localizacion)
    (vacia ?a - ambulancia)
    (cargada ?a - ambulancia ?e - enfermo)
)

;define actions here
(:action Conducir
    :parameters (?a - ambulancia ?localizacionOrigen - localizacion ?localizacionDestino - localizacion)
    :precondition (and 
        (ubicacion ?a ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)
    )
    :effect (and 
        (ubicacion ?a ?localizacionDestino)
        (not (ubicacion ?a ?localizacionOrigen))
    )
)
(:action ConducirSirena
    :parameters (?a - ambulancia ?e - enfermo ?localizacionOrigen - localizacion ?localizacionDestino - localizacion)
    :precondition (and 
        (ubicacion ?a ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)
        (cargada ?a ?e)
        (not (vacia ?a))
    )
    :effect (and 
        (ubicacion ?a ?localizacionDestino)
        (not (ubicacion ?a ?localizacionOrigen))
    )
)
(:action Subir
    :parameters (?a - ambulancia ?e - enfermo ?l - localizacion)
    :precondition (and 
        (ubicacion ?a ?l)
        (ubicacion ?e ?l)
        (vacia ?a)
    )
    :effect (and 
        (not (ubicacion ?e ?l))
        (not (vacia ?a))
        (cargada ?a ?e)
    )
)
(:action Bajar
    :parameters (?a - ambulancia ?e - enfermo ?l - localizacion)
    :precondition (and 
        (ubicacion ?a ?l)
        (not (vacia ?a))
        (cargada ?a ?e)
    )
    :effect (and 
        (ubicacion ?e ?l)
        (vacia ?a)
        (not (cargada ?a ?e))
    )
)
)