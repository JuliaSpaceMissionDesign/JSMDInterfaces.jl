export AbstractFrameGraphModel, AbstractFrameGraphAxisNode, AbstractFrameGraphPointNode,
       vector3, vector6, vector9, vector12,
       rotation3, rotation6, rotation9, rotation12

using Graphs: AbstractGraph

"""
    AbstractFrameGraphModel

Abstract type for frames graphs. 
Subtype it to create a new frames graph compatible with the ecosystem.
"""
abstract type AbstractFrameGraphModel{T} <: AbstractGraph{T} end

"""
    AbstractFrameGraphPointNode

Abstract type for frame graphs points nodes. 
Subtype it to create a point node type for a frame graph.
"""
abstract type AbstractFrameGraphPointNode <: AbstractGraphNode end

"""
    AbstractFrameGraphAxisNode

Abstract type for frame graphs axes nodes. 
Subtype it to create an axis node type for a frame graph.
"""
abstract type AbstractFrameGraphAxisNode <: AbstractGraphNode end

# ----
# JSMD interface 

"""
    vector3(model::F, from::Int, to::Int, axis::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a position vector using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function vector3(::F, ::Int, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end

"""
    vector6(model::F, from::Int, to::Int, axis::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a position and velocity vector using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function vector6(::F, ::Int, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end

"""
    vector9(model::F, from::Int, to::Int, axis::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a position, velocity, and acceleration vector 
using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function vector9(::F, ::Int, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end

"""
    vector12(model::F, from::Int, to::Int, axis::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a position, velocity, acceleration, and jerk vector 
using a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or point for the vector.
- `to::Int`: The destination node or point for the vector.
- `axis::Int`: The specific axis of the vector.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function vector12(::F, ::Int, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end

"""
    rotation3(model::F, from::Int, to::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a rotation matrix between two axes within 
a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function rotation3(::F, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end

"""
    rotation6(model::F, from::Int, to::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a rotation matrix and its first derivative 
between two axes within a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function rotation6(::F, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end

"""
    rotation9(model::F, from::Int, to::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a rotation matrix, its first, second 
derivative between two axes within a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function rotation9(::F, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end

"""
    rotation12(model::F, from::Int, to::Int, time::T) where {T, F <: AbstractFrameGraphModel}

This function serves as an interface for constructing a rotation matrix, its first, second and third 
derivative between two axes within a frame graph model.

### Arguments
- `model::F`: An instance of a subtype of `AbstractFrameGraphModel`, representing the frame graph model.
- `from::Int`: The source node or axis for the rotation matrix.
- `to::Int`: The destination node or axis for the rotation matrix.
- `time::T`: The independent variable (time), in seconds since J2000.

!!! warning 
    Concrete implementations of `AbstractFrameGraphModel` must provide this function!
"""
@interface function rotation12(::F, ::Int, ::Int, ::T) where {T, F <: AbstractFrameGraphModel} end