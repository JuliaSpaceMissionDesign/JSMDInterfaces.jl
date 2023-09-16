module Models

using JSMDInterfaces.Errors

abstract type AbstractJSMDModelData end
abstract type AbstractJSMDModel end 


function parse_data(::Type{T}, ::Type{D},  
    filename::AbstractString; kargs...) where {T, D<:AbstractJSMDModelData}
    throw(
        NotImplementedError(
            "\`parse_data\` shall be implemented for $D model data with $T content!"
        )
    )
end 

function parse_model(::Type{T}, ::Type{M}, ::Type{D}, 
    args...) where {T, D<:AbstractJSMDModelData, M<:AbstractJSMDModel}
    throw(
        NotImplementedError(
            "\`parse_data\` shall be implemented for $M model with $D data in $T content-type!"
        )
    )
end

function dump_model(::AbstractJSMDModel, node, args...) end 

function load_model(::Type{T}, ::Type{<:AbstractJSMDModel}, node, args...) where T end

end