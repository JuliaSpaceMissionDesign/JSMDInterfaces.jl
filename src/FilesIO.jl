module FilesIO

export load, filepath, filepaths

abstract type AbstractFile end

"""
    filepaths(files::AbstractFile)

Return the path of all the files loaded within `file`.
"""
function filepaths(::AbstractFile) end

"""
    filepath(files::AbstractFile, idx::Int)

Return the path of the `idx`-th file within `files`.
"""
function filepath(::AbstractFile, idx::Int) end

"""
    load(files::T) where T <: AbstractFile

Generic loader of different file/s formats.
"""
function load(::AbstractFile) end
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

            function FilesIO.filepath(ft::$ftype, idx::Int=1)
                return ft.files[idx]
            end

            function FilesIO.filepaths(ft::$ftype)
                return ft.files
            end
        end,
    )
end

end