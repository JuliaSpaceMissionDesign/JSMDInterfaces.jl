module Graph

using JSMDInterfaces.Interface

import Graphs

"""    
    AbstractJSMDGraph{T}

Abstract type for graphs. 
Subtype it to create graphs compatible with the JSMD ecosystem.

Graphs here could be compatible with both JSMD ecosystem and [`Graphs.jl`](https://github.com/JuliaGraphs/Graphs.jl):
 - For `JSMD` compatibility, see also: [`has_path`](@ref) and [`get_path`](@ref).
 - For `Graphs.jl` compatibility, see also: [Graphs.jl interface](https://juliagraphs.org/Graphs.jl/dev/ecosystem/interface/)
"""
abstract type AbstractJSMDGraph{T} <: Graphs.AbstractGraph{T} end 


"""    
    AbstractJSMDGraphNode

Abstract type for graph nodes. 
Subtype it to create a node graph compatible with the JSMD ecosystem.
"""
abstract type AbstractJSMDGraphNode end


# Graphs interfaces
# ==================

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


# JSMD interfaces
# ==================

"""
    add_edge!(g::AbstractJSMDGraph, from::Int, to::Int, cost::Int)

This function add an edge between `from` and `to` with weight `cost`.
"""
@interface function Graphs.add_edge!(::AbstractJSMDGraph, ::Int, ::Int, ::Int) end 

"""
    has_path(g::AbstractJSMDGraph, from::Int, to::Int)

Return true if there is a path between `from` and `to` in the graph `g`.
"""
@interface function Graphs.has_path(::AbstractJSMDGraph, ::Int, ::Int) end 

"""
    add_node!(g::AbstractJSMDGraph, node::AbstractJSMDGraphNode)

This function adds `node` to the graph `g`.
"""
@interface function add_node!(::AbstractJSMDGraph, ::N) where {N<:AbstractJSMDGraphNode} end 

"""
    get_path(g::AbstractJSMDGraph, from::Int, to::Int)

Get the nodes on hte path between and including `from' and `to`. Returns an empty array if 
either `from` or `to` are not part of `g` or if there is no path between them.
"""
@interface function get_path(::AbstractJSMDGraph, ::Int, ::Int) end 

end