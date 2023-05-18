module Errors

export AbstractGenericException, @custom_error, GenericError, NotImplementedError

"""
    AbstractGenericException

A supertype for all ecosystem related errors.
"""
abstract type AbstractGenericException <: Exception end

"""
    @custom_error

Create a type representing a custom error type.
"""
macro custom_error(expr)
    name = expr.args[2]
    if name isa Symbol
        ename = name
    elseif name.head == Symbol("<:")
        ename = name.args[1]
    end
    descr = expr.args[3].args[2]

    return esc(
        quote
            """
                $($(name))

            A type representing $($(descr)).
            """
            struct $name
                msg::String
            end

            function Base.showerror(io::IO, err::$ename)
                return println(io, "$($ename): $(err.msg)")
            end
            
            export $ename
        end,
    )
end

#
# error types 
# 

@custom_error struct GenericError <: AbstractGenericException
    "generic errors"
end
@custom_error struct NotImplementedError <: AbstractGenericException
    "not implemented errors"
end

end
