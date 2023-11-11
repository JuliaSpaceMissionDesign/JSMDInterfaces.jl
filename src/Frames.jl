module Frames

using Graphs: AbstractGraph
using JSMDInterfaces.Interface: @interface

export AbstractJSMDFrameGraph,
       vector3, vector6, vector9, vector12,
       rotation3, rotation6, rotation9, rotation12

"""
    AbstractJSMDFrameGraph

Abstract type for frames graphs. 
Subtype it to create a new frames graph compatible with the ecosystem.
"""
abstract type AbstractJSMDFrameGraph{T} <: AbstractGraph{T} end

# ----
# JSMD interface 

"""
    vector3(model::F, from::Int, to::Int, axis::Int, time::Number)

This function serves as an interface for constructing a position vector using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function vector3(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Int, ::Number) end

"""
    vector6(model::F, from::Int, to::Int, axis::Int, time::Number)

This function serves as an interface for constructing a position and velocity vector using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function vector6(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Int, ::Number) end

"""
    vector9(model::F, from::Int, to::Int, axis::Int, time::Number)

This function serves as an interface for constructing a position, velocity, and acceleration vector 
using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function vector9(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Int, ::Number) end

"""
    vector12(model::F, from::Int, to::Int, axis::Int, time::Number)

This function serves as an interface for constructing a position, velocity, acceleration, and jerk vector 
using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function vector12(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Int, ::Number) end

"""
    rotation3(model::F, from::Int, to::Int, time::Number)

This function serves as an interface for constructing a rotation matrix between two axes within 
a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function rotation3(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Number) end

"""
    rotation6(model::F, from::Int, to::Int, time::Number)

This function serves as an interface for constructing a rotation matrix and its first derivative 
between two axes within a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function rotation6(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Number) end

"""
    rotation9(model::F, from::Int, to::Int, time::Number)

This function serves as an interface for constructing a rotation matrix, its first, second 
derivative between two axes within a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function rotation9(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Number) end

"""
    rotation12(model::F, from::Int, to::Int, time::Number)

This function serves as an interface for constructing a rotation matrix, its first, second and third 
derivative between two axes within a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractJSMDFrameGraph`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractJSMDFrameGraph` must provide this function!
"""
@interface function rotation12(::AbstractJSMDFrameGraph, ::Int, ::Int, ::Number) end

end