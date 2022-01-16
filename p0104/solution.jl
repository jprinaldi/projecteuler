using Base.MathConstants

function approxfib(n::Int)::BigInt
    round(BigInt, BigFloat(φ)^n / BigFloat(sqrt(5)))
end

function ispandigital(ds)::Bool
    length(ds) == 9 && 0 ∉ ds && allunique(ds)
end

function solve(upper_bound=10^6)::Int
    a, b = 0, 1
    for n in 2:upper_bound
        a, b = b, (a + b) % 10^9
        if ispandigital(digits(b))
            f = approxfib(n)
            df = last(digits(f), 9)
            ispandigital(df) && return n
        end
    end
end
