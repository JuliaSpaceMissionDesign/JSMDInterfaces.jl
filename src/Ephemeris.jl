module Ephemeris

export AbstractEphemerisProvider, load, ephem_compute!, ephem_orient!, EphemerisError

using JSMDInterfaces.Errors: @custom_error, AbstractGenericException
using JSMDInterfaces.Interface: @interface
import JSMDInterfaces.FilesIO: load

@custom_error struct EphemerisError <: AbstractGenericException
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
    jd_start::Float64
    jd_stop::Float64
    axes::Int
end

"""
    load(::Type{<:AbstractEphemerisProvider}, files)

Load ephemeris files.
"""
@interface function load(provider::Type{<:AbstractEphemerisProvider}, files)
    return provider(files)
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
        @interface function ($fun)(eph::AbstractEphemerisProvider) end
        export $fun
    end
end

"""
    ephem_compute!(res, eph::AbstractEphemerisProvider, jd0::Number, time::Number, 
        target::Int, center::Int, order::Int)

Abstract method to compute position and derivatives up to `order` of `target` with 
respect to `center` at the Julian Date `jd0 + time`.

### Inputs 
- `eph` -- Ephemeris provider.
- `jd0`, `time` -- `jd0 + time` must be equal to the Julian Day for the time coordinate 
    corresponding to the ephemeris. 
- `target` -- The body or reference point whose coordinates are required. 
- `center` -- The origin of the coordinate system. 
- `order` -- The order of derivatives from 0 (position) to 3 (position, velocity, 
    acceleration and jerk).
"""
@interface function ephem_compute!(
    res, eph::AbstractEphemerisProvider, ::Number, ::Number, ::Int, ::Int, ::Int
)
end

"""
    ephem_orient!(res, eph::AbstractEphemerisProvider, jd0::Number, time::Number, 
        target::Int, center::Int, order::Int)

Abstract method to compute Euler angles and derivatives up to `order` for the orientation of 
the `target` axes at epoch `jd0 + time`.

### Inputs
- `eph` -- Ephemeris provider.
- `jd0`, `time` -- `jd0 + time` must be equal to the Julian Day for the time coordinate 
    corresponding to the ephemeris. 
- `target` -- The axes whose orientation is required.
- `center` -- The parent set of axes.
- `order` -- The order of derivatives from 0 (angles) to 3 (angles, angles rate, etc...).

"""
@interface function ephem_orient!(
    res, ::AbstractEphemerisProvider, ::Number, ::Number, ::Int, ::Int, ::Int
)
end

end
