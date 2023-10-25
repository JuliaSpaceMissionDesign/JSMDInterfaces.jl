using JSMDInterfaces
using Documenter

const CI = get(ENV, "CI", "false") == "true"

makedocs(;
    modules=[JSMDInterfaces],
    authors="Andrea Pasquale <andrea.pasquale@polimi.it> and Michele Ceresoli <michele.ceresoli@polimi.it>",
    sitename="JSMDInterfaces.jl",
    format=Documenter.HTML(; prettyurls=CI, highlights=["yaml"], ansicolor=true),
    pages=["Home" => "index.md", 
            "Interfaces" => [
                "interfaces/Errors.md",
                "interfaces/Interface.md",
                "interfaces/FilesIO.md",
                "interfaces/Math.md",
                "interfaces/Ephemeris.md",
                "interfaces/Models.md"
            ]
        ],
)

if CI 
    deploydocs(;
        repo="github.com/JuliaSpaceMissionDesign/JSMDInterfaces.jl", branch="gh-pages"
    )
end