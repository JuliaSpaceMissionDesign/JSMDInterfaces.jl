module Errors

export AbstractGenericException, @module_error, GenericError, NotImplementedError

"""
    AbstractGenericException

A supertype for all ecosystem related errors.
"""
abstract type AbstractGenericException <: Exception end

"""
    @module_error

Create a type representing an error associated to a specific module.
"""
macro module_error(expr)
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
                mod::String
                msg::String
            end
            
            function ($ename)(msg::String)
                return $(ename)(String(Symbol(@__MODULE__)), msg)
            end

            function Base.showerror(io::IO, err::$ename)
                return println(io, "($(err.mod)) $(err.msg)")
            end
            
            export $ename
        end,
    )
end

#
# error types 
# 

@module_error struct GenericError <: AbstractGenericException
    "generic errors"
end
@module_error struct NotImplementedError <: AbstractGenericException
    "not implemented errors"
end

end
