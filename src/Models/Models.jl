module Models

using JSMDInterfaces.Errors
using JSMDInterfaces.Interface: @interface
using JSMDInterfaces.FilesIO: AbstractArchiveNode

include("abstract.jl")
include("acceleration.jl")

end