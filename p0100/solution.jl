function ispronic(n::Int128)::Bool
    x::Int64 = floor(Int64, sqrt(n))
    return widemul(x, x + 1) == n
end

function solve(target=10^12)
    b::Int64 = ceil(Int64, (1 + sqrt(2 * big(target)^2 + 1)) / 2)
    while !ispronic(2 * widemul(b, b - 1))
        b += 1
    end
    return b
end
