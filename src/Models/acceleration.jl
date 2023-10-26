export AbstractAccelerationModel, AbstractAccelerationModelData, compute_acceleration

"""
    AbstractAccelerationModel

Basic abstract type for acceleration models compatible with JSMD ecosystem.
"""
abstract type AbstractAccelerationModel <: AbstractJSMDModel end

"""
    AbstractAccelerationModel

Basic abstract type for acceleration models data compatible with JSMD ecosystem.
"""
abstract type AbstractAccelerationModelData <: AbstractJSMDModelData end

"""
    compute_acceleration(::M, args...; kwargs...) where {M <: AbstractAccelerationModel} end

This function serves as an interface to compute accelerations from JSMD compatible
acceleration models.
"""
@interface function compute_acceleration(::M, args...; 
    kwargs...) where {M <: AbstractAccelerationModel} end