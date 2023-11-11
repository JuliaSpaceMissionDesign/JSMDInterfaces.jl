module Models

using JSMDInterfaces.Errors
using JSMDInterfaces.Interface
using JSMDInterfaces.FilesIO: AbstractArchiveNode

export AbstractJSMDModel, 
       AbstractJSMDModelData, 
       parse_data, parse_data, 
       dump_model, load_model

"""
    AbstractJSMDModelData

Basic abstract type for every JSMD compatible model data. 

JSMD _ModelData_ types are the interface of the JSMD environment with the external world, 
and are meant to provide a model agnostic interface to any customly formatted file.

The main objective of this data type is to create a JSMD simulation compatible _Model_ 
by means of the [`parse_model`](@ref) interface.
"""
abstract type AbstractJSMDModelData end

"""
    AbstractJSMDModel

Basic abstract type for every JSMD compatible model. 
"""
abstract type AbstractJSMDModel end 

"""
    parse_data(::Type{T}, ::Type{D}, ::AbstractString; 
        kargs...) where {T, D <: AbstractJSMDModelData} end 

This function serves as an interface to create a JSMD compatible 
model data object from a file.
"""
@interface function parse_data(::Type{T}, ::Type{D}, ::AbstractString; 
    kargs...) where {T, D <: AbstractJSMDModelData} end 

"""
    parse_model(::Type{T}, ::Type{M}, ::Type{D}, args...; 
        kargs...) where {T, D <: AbstractJSMDModelData, M <: AbstractJSMDModel}

This function serves as an interface to create a JSMD compatible 
model type from a _ModelData_ type.
"""
@interface function parse_model(::Type{T}, ::Type{M}, ::Type{D}, args...; 
    kargs...) where {T, D <: AbstractJSMDModelData, M <: AbstractJSMDModel} end

"""
    dump_model(::AbstractJSMDModel, ::N, args...; 
        kargs...) where {N <: AbstractArchiveNode}

This function serves as an interface to dump to an archive node a JSMD compatible model.
"""
@interface function dump_model(::AbstractJSMDModel, ::N, args...; 
    kargs...) where {N <: AbstractArchiveNode} end 

"""
    load_model(::Type{T}, ::Type{ <: AbstractJSMDModel}, ::N, 
        args...; kargs...) where {T, N <: AbstractArchiveNode} 

This function serves as an interface to load from an archive node a JSMD compatible model.
"""
@interface function load_model(::Type{T}, ::Type{<:AbstractJSMDModel}, ::N, 
    args...; kargs...) where {T, N <: AbstractArchiveNode} end

end