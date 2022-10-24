using TheGraphEnvironments
using Documenter

DocMeta.setdocmeta!(TheGraphEnvironments, :DocTestSetup, :(using TheGraphEnvironments); recursive=true)

makedocs(;
    modules=[TheGraphEnvironments],
    authors="Semiotic AI Inc.",
    repo="https://github.com/semiotic-ai/TheGraphEnvironments.jl/blob/{commit}{path}#{line}",
    sitename="TheGraphEnvironments.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://semiotic-ai.github.io/TheGraphEnvironments.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/semiotic-ai/TheGraphEnvironments.jl",
    devbranch="main",
)
