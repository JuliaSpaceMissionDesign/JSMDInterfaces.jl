module Ephemeris

export AbstractEphemerisProvider, load, ephem_compute!, ephem_orient!, EphemerisError

using SMDInterfacesUtils.Interfaces.Errors: @module_error, AbstractGenericException
import SMDInterfacesUtils.IO: load

@module_error struct EphemerisError <: AbstractGenericException
    "ephemeris load or computations errors"
end

"""
    AbstractEphemerisProvider

Abstract type to represent ephemeris types.
"""
abstract type AbstractEphemerisProvider end

"""
    EphemPointRecord 

Store a position record metadata.

### Fields 
- `target` -- NAIF ID of the target point.
- `center` -- NAIF ID of the center point.
- `jd_start` -- Julian date of the first time.
- `jd_end` -- Julian date of the last time.
- `axes` -- NAIF ID of the reference axes.

"""
struct EphemPointRecord
    target::Int
    center::Int
    jd_start::Float64
    jd_stop::Float64
    axes::Int
end

"""
    EphemAxesRecord 

Store an orientation record metadata.

### Fields 
- `target` -- NAIF ID of the target axes.
- `jd_start` -- Julian date of the first time.
- `jd_end` -- Julian date of the last time.
- `axes` -- NAIF ID of the reference axes.

"""
struct EphemAxesRecord
    target::Int
    start_epoch::Float64
    stop_epoch::Float64
    axes::Int
end

"""
    load(::Type{<:AbstractEphemerisProvider}, files::String...)

Load ephemeris files.
"""
function load(provider::Type{<:AbstractEphemerisProvider}, files::String...)
    return provider(files)AbstractFile
end

for fun in (
    :ephem_position_records,
    :ephem_orient_records,
    :ephem_available_points,
    :ephem_available_axes,
    :ephem_timespan,
    :ephem_timescale,
)
    @eval begin
        function ($fun)(eph::E) where {E<:AbstractEphemerisProvider}
            throw(
                NotImplementedError(
                    String(Symbol(@__MODULE__)),
                    "$($fun) shall be implemented for type $(typeof(eph))",
                ),
            )
        end
        export $fun
    end
end

"""
    ephem_compute!(res, eph::E, jd0::Number, time::Number, target::Int, 
        center::Int, order::Int) where {E<:AbstractEphemerisProvider}

Abstract method to compute ephemeris. 

### Algorithm 

Compute position and derivatives up to order of target with respect to center at epoch 
jd0+time.

### Arguments 

- `eph` -- ephemeris
- `jd0` -- jd0+time must be equal to the Julian Day for the time coordinate corresponding to the ephemeris. 
- `time` -- jd0+time must be equal to the Julian Day for the time coordinate corresponding to the ephemeris. 
- `target` -- The body or reference point whose coordinates are required. 
- `center` -- The origin of the coordinate system. 
- `order` -- The order of derivatives from 0 (position) to 3 (position, velocity, acceleration and jerk).
"""
function ephem_compute!(
    res, eph::E, jd0::Number, time::Number, target::Int, center::Int, order::Int
) where {E<:AbstractEphemerisProvider}
    throw(
        NotImplementedError(
            String(Symbol(@__MODULE__)),
            "`ephem_compute!` shall be implemented for type $(typeof(eph))",
        ),
    )
end

"""
    ephem_orient!(res, eph::E, jd0::Number, time::Number, target::Int, 
        order::Int) where {E<:AbstractEphemerisProvider}

Abstract method to compute orientations.

### Algorithm

Compute Euler angles and derivatives up to order for the orientation of target at epoch jd0+time.

### Arguments
- `eph`: ephemeris
- `jd0`: jd0+time must be equal to the Julian Day for the time coordinate corresponding to the ephemeris.
- `time`: jd0+time must be equal to the Julian Day for the time coordinate corresponding to the ephemeris.
- `target`: The body whose orientation is required.
- `order` -- The order of derivatives from 0 (position) to 3 (position, velocity, acceleration and jerk).
"""
function ephem_orient!(
    res, eph::E, jd0::Number, time::Number, target::Int, order::Int
) where {E<:AbstractEphemerisProvider}
    throw(
        NotImplementedError(
            String(Symbol(@__MODULE__)),
            "`ephem_orient!` shall be implemented for type $(typeof(eph))",
        ),
    )
end

end
