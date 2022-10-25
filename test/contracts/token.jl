# Copyright 2022-, Semiotic AI, Inc.
# SPDX-License-Identifier: Apache-2.0

@testset "contracts/token" begin
    seed = 43
    rng = StableRNG(seed)
    @testset "tokenissuance" begin
        t = 0
        r = -1
        Σ = 100
        @test_throws ArgumentError tokenissuance(t, r, Σ)

        t = -1
        r = 2
        Σ = 100
        @test_throws ArgumentError tokenissuance(t, r, Σ)

        t = 0
        r = 1
        Σ = 100
        rv = tokenissuance(t, r, Σ)
        @test rv == 0
        t = 1
        r = 0
        Σ = 100
        rv = tokenissuance(t, r, Σ)
        @test rv == 0
        t = 1
        r = 1
        Σ = 0
        rv = tokenissuance(t, r, Σ)
        @test rv == 0

        # When r = 1, no tokens are issued
        t = rand(rng, 1:100)
        r = 1
        Σ = rand(rng, (1:0.1:100))
        rv = tokenissuance(t, r, Σ)
        @test rv == 0

        # When r > 1, tokens issued should be greater than 0
        t = rand(rng, (1:100))
        r = rand(rng, (1.1:0.1:100))
        Σ = rand(rng, (1:0.1:100))
        rv = tokenissuance(t, r, Σ)
        @test rv > 0

        # With r = 2, tokens issued is Σ
        t = 1
        r = 2
        Σ = rand(rng, (1:0.1:100))
        rv = tokenissuance(t, r, Σ)
        @test rv == Σ
    end
end
