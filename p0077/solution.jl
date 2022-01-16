using Primes

function s(n, ps, memo)
    if n == 0
        return 1
    elseif n < 0 || isempty(ps)
        return 0
    elseif haskey(memo, (n, ps))
        return memo[(n, ps)]
    end
    memo[(n, ps)] = s(n - last(ps), ps, memo) + s(n, ps[1:end - 1], memo)
    return memo[(n, ps)]
end

function s(n)
    memo = Dict()
    s(n, primes(n), memo)
end

function solve(target_count=5_000)
    n = 2
    while s(n) <= target_count
        n += 1
    end
    n
end
