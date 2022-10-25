# Copyright 2022-, Semiotic AI, Inc.
# SPDX-License-Identifier: Apache-2.0

export subgraphreward

"""
    subgraphreward(t::Integer, r::Real, Σ::Real, ψs::Base.AbstractVecOrTuple{Real}, i::Integer)

The reward on a subgraph with signal `ψ` when each subgraph has signal in `ψs`.

The issuance rate is `r`, the number of blocks over which to calculate the reward is `t`
and the current token supply is `Σ`.
"""
function subgraphreward(t::Integer, r::Real, Σ::Real, ψs::Base.AbstractVecOrTuple{T}, ψ::T) where {T<:Real}
    ψ == 0 && return 0.0
    newtokens = tokenissuance(t, r, Σ)
    return ψ ./ sum(ψs) * newtokens
end
