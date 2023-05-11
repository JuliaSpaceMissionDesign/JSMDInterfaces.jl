module IO 

export load, filepath, filepaths

abstract type AbstractFile end

function filepaths(::T) where {T<:AbstractFile} end
function filepath(::T, idx::Int) where {T<:AbstractFile} end

"""
    load(files::T) where T <: AbstractFile

Generic loader of different file/s formats.
"""
function load(::T) where {T<:AbstractFile} end
function load(::Type{T}, files::String...) where {T<:AbstractFile} end

"""
    filetype(ftype, suptype)

Create a type representing a specific file and the associated 
[`filepaths`](@ref) and [`filepath`](@ref) implementations.
"""
macro filetype(ftype, suptype)
    return esc(
        quote
            """
                $($ftype) <: $($supertype)

            A type representing $($ftype) files.
            """
            struct $ftype{N} <: $suptype
                files::NTuple{N,String}
            end

            function $(ftype)(files...)
                return $ftype{length(files)}(files)
            end

            function filepath(ft::$ftype, idx::Int=1)
                return ft.files[idx]
            end

            function filepaths(ft::$ftype)
                return ft.files
            end
        end,
    )
end

end