module FilesIO

using JSMDInterfaces.Interface: @interface
using SMDGraphs: AbstractGraphNode

export load, filepath, filepaths

abstract type AbstractFile end

# Generic files 

"""
    filepaths(files::AbstractFile)

Return the path of all the files loaded within `file`.
"""
@interface function filepaths(::AbstractFile) end

"""
    filepath(files::AbstractFile, idx::Int=1)

Return the path of the `idx`-th file within `files`. 
"""
@interface function filepath(::AbstractFile, idx::Int=1) end

"""
    load(files::T) where T <: AbstractFile

Generic loader of different file/s formats.
"""
@interface function load(::AbstractFile) end
@interface function load(::Type{T}, files::String...) where {T<:AbstractFile} end

"""
    filetype(ftype, suptype)

Create a type representing a specific file and the associated 
[`filepaths`](@ref) and [`filepath`](@ref) implementations.
"""
macro filetype(ftype, suptype)
    return esc(
        quote
            """
                $($ftype) <: $($suptype)

            A type representing $($ftype) files.
            """
            struct $ftype{N} <: $suptype
                files::NTuple{N,String}
            end

            function $(ftype)(files...)
                return $ftype{length(files)}(files)
            end

            function FilesIO.filepath(ft::$ftype, idx::Int=1)
                return ft.files[idx]
            end

            function FilesIO.filepaths(ft::$ftype)
                return ft.files
            end
        end,
    )
end

# JSMD interface 

abstract type AbstractArchiveNode <: AbstractGraphNode end

"""
    function load(::AbstractArchiveNode)

Generic loader for JSMD archive nodes.
"""
@interface function load(::AbstractArchiveNode) end 

end