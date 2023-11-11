module Graph

using JSMDInterfaces.Interface: @interface 

using Graphs

import Graphs: has_vertex, has_edge, edges, edgetype, inneighbors, ne, nv, outneighbors, vertices, is_directed

"""    
    AbstractJSMDGraph{T}

Abstract type for graphs. 
Subtype it to create a graphs compatible with the ecosystem.

Graphs here could be compatible with both JSMD ecosystem and [`Graphs.jl`](https://github.com/JuliaGraphs/Graphs.jl).

For `JSMD` compatibility, see also: 
[`add_vertex!`](@ref), 
[`add_edge!`](@ref).

For `Graphs.jl` compatibility, see also: 
[`has_vertex`](@ref Graphs.has_vertex)
[`has_edge`](@ref Graphs.has_edge)
[`edges`](@ref Graphs.edges)
[`edgetype`](@ref Graphs.edgetype)
[`inneighbors`](@ref Graphs.inneighbors)
[`ne`](@ref Graphs.ne)
[`nv`](@ref Graphs.nv)
[`outneighbors`](@ref Graphs.outneighbors)
[`vertices`](@ref Graphs.vertices)
[`is_directed`](@ref Graphs.is_directed)
"""
abstract type AbstractJSMDGraph{T} <: AbstractGraph{T} end 

"""    
    AbstractJSMDGraphNode

Abstract type for graph nodes. 
Subtype it to create a graph nodes compatible with the ecosystem.
"""
abstract type AbstractJSMDGraphNode end

# Graphs interface

@interface function Graphs.has_vertex(::AbstractJSMDGraph, ::Int) end 

@interface function Graphs.has_edge(::AbstractJSMDGraph, ::Int, ::Int) end

@interface function Graphs.edges(::AbstractJSMDGraph) end 

@interface function Graphs.edgetype(::AbstractJSMDGraph) end 

@interface function Graphs.inneighbors(::AbstractJSMDGraph, ::Int) end 

@interface function Graphs.ne(::AbstractJSMDGraph) end 

@interface function Graphs.nv(::AbstractJSMDGraph) end 

@interface function Graphs.outneighbors(::AbstractJSMDGraph, ::Int) end 

@interface function Graphs.vertices(::AbstractJSMDGraph) end 

@interface function Graphs.is_directed(::AbstractJSMDGraph) end 

# JSMD interface

"""
    add_vertex!(::AbstractJSMDGraph, ::N)

This function serves as an interface for inserting a new vertex in a graph.

!!! warning 
    Concrete implementations of `AbstractJSMDGraph` must provide this function!
"""
@interface function add_vertex!(::AbstractJSMDGraph, ::N) where {N<:AbstractJSMDGraphNode} end 

"""
    add_edge!(::AbstractJSMDGraph, ::Int, ::Int, ::Int)

This function serves as an interface for inserting a new (weighted) edge in a graph.

!!! warning 
    Concrete implementations of `AbstractJSMDGraph` must provide this function!
"""
@interface function add_edge!(::AbstractJSMDGraph, ::Int, ::Int, ::Int) end 

end