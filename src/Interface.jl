module Interface

import JSMDInterfaces.Errors: NotImplementedError

export @interface, NotImplementedError

"""
    @interface 

This macro can be used to create a in interface function within the 
JSMD ecosystem. 

Interface functions are intended as functions with some abstract 
types as inputs throwing a [`NotImplementedError`](@ref) as default behaviour.
"""
macro interface(expr)

    full_signature = expr.args[1]
    fun_where = :()

    if full_signature.head == :where 
        fun_signature = full_signature.args[1]
        is_parametric = true

        if fun_signature.head == :call 
            fun_name = fun_signature.args[1]

            if length(fun_signature.args) < 2
                throw(
                    ErrorException(
                        "Interface definition error! Function definition shall have"*
                        " at least one argument."
                    )
                )
            end

            fun_args = fun_signature.args[2:end]
            fun_where = full_signature.args[2:end]

        else 
            throw(ErrorException("Interface definition error!"))
        end

    elseif full_signature.head == :call
        fun_signature = full_signature
        fun_name = fun_signature.args[1]

        if length(fun_signature.args) < 2
            throw(
                ErrorException(
                    "Interface definition error! Function definition shall have"*
                    " at least one argument."
                )
            )
        end

        fun_args = fun_signature.args[2:end]
        is_parametric = false
        
    else 
        throw(ErrorException("Interface definition error! Shall be a valid function."))
    end
    
    if is_parametric
        return esc(
            quote
                function ($fun_name)($(fun_args...)) where {$(fun_where...)}
                    throw(
                        NotImplementedError(
                            "No method compatible with the current call has been"*
                            " implemented for the interface '$($fun_name)'!"
                        )
                    )
                end
            end
        )
    else
        return esc(
            quote
                function ($fun_name)($(fun_args...))
                    throw(
                        NotImplementedError(
                            "No method compatible with the current call has been"*
                            " implemented for the interface '$($fun_name)'!"
                        )
                    )
                end
            end
        )
    end

end

end