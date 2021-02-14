module CharFuncPricing
export DefaultCharFunc, CharFunc

abstract type CharFunc{MT,CR} end

struct DefaultCharFunc{MT,CR} <: CharFunc{MT,CR} #model type, return type (e.g. Complex or acb)
    model::MT
end

@inline model(cf::DefaultCharFunc) = cf.model
@inline oneim(cf::CharFunc) = 1im
@inline oneim(cf::CharFunc{MT,Complex{T}}) where {MT,T} = 1im
@inline oneim(cf::CharFunc{MT,Complex}) where {MT} = 1im
@inline Base.zero(cf::CharFunc{MT,Complex}) where {MT} = Base.zero(Float64)
@inline Base.zero(cf::CharFunc{MT,Complex{BigFloat}}) where {MT} = Base.zero(BigFloat)
@inline const_pi(cf::CharFunc{MT,Complex{T}}) where {MT,T} = T(pi)
@inline const_pi(cf::CharFunc{MT,Complex}) where {MT} = Float64(pi)



include("lambertw.jl")
include("Heston.jl")
include("SchobelZhu.jl")
include("Cos.jl")
include("Flinn.jl")
include("NemoCharFunc.jl")
include("GaussLobatto.jl")
include("AndersenLake.jl")
end
