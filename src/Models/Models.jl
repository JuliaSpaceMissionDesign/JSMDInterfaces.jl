module Models

using JSMDInterfaces.Errors
using SMDGraphs: AbstractGraphNode
using JSMDInterfaces.Interface: @interface
using JSMDInterfaces.FilesIO: AbstractArchiveNode

include("abstract.jl")
include("acceleration.jl")
include("frame.jl")

end