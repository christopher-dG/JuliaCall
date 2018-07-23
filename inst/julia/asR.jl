asDouble(x) = float(x)
asDouble(x :: Complex) = asDouble(real(x))
asDouble(x :: AbstractArray{T}) where {T <: Complex} = [asDouble(xx) for xx in x]

asCharacter(x) = string(x)

asLogical(x :: Bool) = x
asLogical(x :: Number) = x != 0
asLogical(x :: AbstractString) = ifelse(x in ["T", "TRUE", "true", "True"], true, false)
asLogical(x :: AbstractArray{Bool}) = x
asLogical{T<:Number}(x :: AbstractArray{T}) = [asLogical(xx) for xx in x]
asLogical{T<:AbstractString}(x :: AbstractArray{T}) = [asLogical(xx) for xx in x]

isNumeric(x) = isa(x, Real)
isNumeric(x :: AbstractArray{T}) where {T} = issubtype(T, Real)
