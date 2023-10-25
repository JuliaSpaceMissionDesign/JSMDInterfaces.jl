module Math 

using JSMDInterfaces.Interface: @interface

export interpolate 

"""
    AbstractInterpolationMethod

Abstract type representing any interpolation method.
"""
abstract type AbstractInterpolationMethod end

"""
    interpolate(::AbstractInterpolationMethod, x)

Abstract interpolator call method.
"""
@interface function interpolate(::AbstractInterpolationMethod, x) end

end