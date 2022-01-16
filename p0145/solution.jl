function hasodddigits(n::Int)::Bool
    all(d -> isodd(d), digits(n))
end

function revsum(n::Int)::Int
    ds = digits(n)
    num_digits = length(ds)
    return sum(10^(num_digits - i) * d + 10^(i - 1) * d for (i, d) in enumerate(ds))
end

function isreversible(n::Int)::Bool
    hasodddigits(revsum(n))
end

function solve(upper_bound=10^9)
    reversible_count = 0
    for n in 1:(upper_bound - 1)
        (n % 10 == 0) && continue
        isreversible(n) && (reversible_count += 1)
    end
    return reversible_count
end
