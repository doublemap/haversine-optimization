from libc.math cimport sin, cos, acos


def haversine(tuple coord1, tuple coord2):
    """Given two (lat, lng) tuples, returns the distance between them in
    meters."""
    cdef double lat1
    cdef double lng1
    cdef double lat2
    cdef double lng2
    lat1, lng1 = coord1
    lat2, lng2 = coord2

    if lat1 > 90 or lat1 < -90 or lat2 > 90 or lat2 < -90:
        raise ValueError("Invalid latitude (should be between +/- 90)")
    if lng1 > 180 or lng1 < -180 or lng2 > 180 or lng2 < -180:
        raise ValueError("Invalid longitude (should be between +/- 180)")

    cdef double ph1
    cdef double ph2
    cdef double theta1
    cdef double theta2
    cdef double c
    cdef double arc

    phi1 = (90.0 - lat1) * 0.0174532925
    phi2 = (90.0 - lat2) * 0.0174532925
    theta1 = lng1 * 0.0174532925
    theta2 = lng2 * 0.0174532925

    c = (sin(phi1) * sin(phi2) * cos(theta1 - theta2) + cos(phi1) * cos(phi2))
    arc = acos(c)
    return arc * 6367444.7
