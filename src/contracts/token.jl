# Copyright 2022-, Semiotic AI, Inc.
# SPDX-License-Identifier: Apache-2.0

# https://github.com/graphprotocol/contracts/blob/dev/contracts/token/GraphToken.sol

export tokenissuance

"""
    tokenissuance(t::Integer, r::Real, Σ::Real)

Compute the token issuance over `t` blocks with an issuance rate of `r` and current token
supply of `Σ`.

Throws an `ArgumentError` if `t` or `r` is negative.
"""
function tokenissuance(t::Integer, r::Real, Σ::Real)
    f = nameof(var"#self#")
    (t < 0 || r < 0) && ArgumentError("t and r must be nonnegative in $currmodule.$f.") |> throw
    (t == 0 || r == 0 || Σ == 0) && return 0.0
    return (Σ * r^t) - Σ
end
