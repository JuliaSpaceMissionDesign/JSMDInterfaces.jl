module Bodies 

"""
    body_rotational_elements(T, ::Val{id})

Interface to compute the rotational elements of a body with ID `id`.
Rotational elements includes `α`, `δ` and `W` that identifies the north pole 
of the body and its prime meridian.

The north pole is that pole of rotation that lies on the north side of the 
invariable plane of the solar system. Its direction is specified by the values 
of its right ascension `α`, declination `δ` .

The location of the prime meridian is then given by `W`, which is a rotation 
in the body equator of date. 
"""
function body_rotational_elements end
function ∂body_rotational_elements end
function ∂²body_rotational_elements end
function ∂³body_rotational_elements end

"""
    body_pole(T, ::Val{id})

Interface to compute the north pole direction of the `id` body.
"""
function body_pole end 

"""
    body_right_ascension(T, ::Val{id})

Interface to compute the right ascension of the north pole of a 
body identified by `id`.
"""
function body_right_ascension end 

"""
    body_declination(T, ::Val{id})

Interface to compute the declination of the north pole of a 
body identified by `id`.
"""
function body_declination end 

"""
    body_prime_meridian(T, ::Val{id})

Interface to compute the prime meridian angle of a body identified by `id`.
"""
function body_prime_meridian end 

end