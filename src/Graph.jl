module Graph

using JSMDInterfaces.Interface

import Graphs:
    AbstractGraph,
    has_vertex, 
    has_edge, 
    edges, 
    edgetype, 
    inneighbors, 
    ne, 
    nv, 
    outneighbors, 
    vertices, 
    is_directed, 
    add_vertex!, 
    add_edge!, 
    has_path

"""    
    AbstractJSMDGraph{T}

Abstract type for graphs. 
Subtype it to create graphs compatible with the JSMD ecosystem.

Graphs here could be compatible with both JSMD ecosystem and [`Graphs.jl`](https://github.com/JuliaGraphs/Graphs.jl):
 - For `JSMD` compatibility, see also: [`get_path`](@ref).
 - For `Graphs.jl` compatibility, see also: [Graphs.jl interface](https://juliagraphs.org/Graphs.jl/dev/ecosystem/interface/)
"""
abstract type AbstractJSMDGraph{T} <: AbstractGraph{T} end 


"""    
    AbstractJSMDGraphNode

Abstract type for graph nodes. 
Subtype it to create a node graph compatible with the JSMD ecosystem.
"""
abstract type AbstractJSMDGraphNode end


# Graphs interfaces
# ==================

@interface function has_vertex(::AbstractJSMDGraph, ::Int) end 

@interface function has_edge(::AbstractJSMDGraph, ::Int, ::Int) end

@interface function edges(::AbstractJSMDGraph) end 

@interface function edgetype(::AbstractJSMDGraph) end 

@interface function inneighbors(::AbstractJSMDGraph, ::Int) end 

@interface function ne(::AbstractJSMDGraph) end 

@interface function nv(::AbstractJSMDGraph) end 

@interface function outneighbors(::AbstractJSMDGraph, ::Int) end 

@interface function vertices(::AbstractJSMDGraph) end 

@interface function is_directed(::AbstractJSMDGraph) end 


# JSMD interfaces
# ==================

"""
    add_node!(g::AbstractJSMDGraph, vertex::AbstractJSMDGraphNode)

This function adds `vertex` to the graph `g`.
"""
@interface function add_vertex!(::AbstractJSMDGraph, ::N) where {N<:AbstractJSMDGraphNode} end 

"""
    add_edge!(g::AbstractJSMDGraph, from::Int, to::Int, cost::Int)

This function add an edge between `from` and `to` with weight `cost`.
"""
@interface function add_edge!(::AbstractJSMDGraph, ::Int, ::Int, ::Int) end 

"""
    has_path(g::AbstractJSMDGraph, from::Int, to::Int)

Return true if there is a path between `from` and `to` in the graph `g`.
"""
@interface function has_path(::AbstractJSMDGraph, ::Int, ::Int) end 

"""
    get_path(g::AbstractJSMDGraph, from::Int, to::Int)

Get the nodes on hte path between and including `from' and `to`. Returns an empty array if 
either `from` or `to` are not part of `g` or if there is no path between them.
"""
@interface function get_path(::AbstractJSMDGraph, ::Int, ::Int) end 

end