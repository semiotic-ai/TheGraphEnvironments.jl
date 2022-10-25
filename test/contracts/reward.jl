# Copyright 2022-, Semiotic AI, Inc.
# SPDX-License-Identifier: Apache-2.0

@testset "contracts/reward" begin
    seed = 43
    rng = StableRNG(seed)
    @testset "subgraphreward" begin
        t = 0
        r = rand(rng, (1.1:0.1:100))
        ψs = rand(rng, (1:100), 3)
        Σ = rand(rng, (1:0.1:100))
        @test subgraphreward(t, r, Σ, ψs, ψs[1]) == 0.0
        t = rand(rng, (1:100))
        r = 0
        ψs = rand(rng, (1:100), 3)
        Σ = rand(rng, (1:0.1:100))
        @test subgraphreward(t, r, Σ, ψs, ψs[1]) == 0.0
        t = rand(rng, (1:100))
        r = rand(rng, (1.1:0.1:100))
        ψs = [0, 1, 2]
        Σ = rand(rng, (1:0.1:100))
        @test subgraphreward(t, r, Σ, ψs, ψs[1]) == 0.0
        t = rand(rng, (1:100))
        r = rand(rng, (1.1:0.1:100))
        ψs = rand(rng, (1:100), 3)
        Σ = 0
        @test subgraphreward(t, r, Σ, ψs, ψs[1]) == 0.0

        t = rand(rng, (1:100))
        r = rand(rng, (1.1:0.1:100))
        ψs = rand(rng, (1:100), 3)
        Σ = rand(rng, (1:0.1:100))
        rews = map(ψ -> subgraphreward(t, r, Σ, ψs, ψ), ψs)
        ψp = ψs ./ sum(ψs)
        rewsp = rews ./ sum(rews)
        @test ψp == rewsp
    end
end
