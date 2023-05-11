using JSMDInterfaces
using Documenter

makedocs(;
    modules=[JSMDInterfaces],
    authors="Andrea Pasquale <andrea.pasquale@polimi.it> and Michele Ceresoli <michele.ceresoli@polimi.it>",
    sitename="JSMDInterfaces.jl",
    pages=["Home" => "index.md", 
            "Interfaces" => "interfaces.md"
        ],
)

deploydocs(;
    repo="github.com/JuliaSpaceMissionDesign/JSMDInterfaces.jl", branch="gh-pages"
)