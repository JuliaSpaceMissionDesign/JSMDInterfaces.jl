module Graph

using JSMDInterfaces.Interface: @interface 

using Graphs

import Graphs: has_vertex, has_edge, edges, edgetype, inneighbors, ne, nv, outneighbors, vertices, is_directed

abstract type AbstractJSMDGraph{T} <: AbstractGraph{T} end 

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

@interface function add_vertex!(::AbstractJSMDGraph, ::N) where {N<:AbstractJSMDGraph} end 

@interface function add_edge!(::AbstractJSMDGraph, ::Int, ::Int, ::Int) end 

end