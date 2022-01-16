function triangle(n)::BigInt
    BigInt(n) * (n + 1) / 2
end

function s(a, b, memo)::BigInt
    if min(a, b) == 1
        return triangle(max(a, b))
    end
    if (a, b) in keys(memo)
        return memo[(a, b)]
    end
    memo[(a, b)] = BigInt(a * b) + s(a - 1, b, memo) + s(a, b - 1, memo) - s(a - 1, b - 1, memo)
    return memo[(a, b)]
end

function solve(target=2_000_000)
    answer = nothing
    min_diff = Inf
    upper_bound = trunc(Int, ceil((sqrt(8 * target + 1) - 1) / 2))
    a = 1
    b = upper_bound
    memo = Dict()
    for a in 1:upper_bound
        for b in a:upper_bound
            solution = s(a, b, memo)
            if abs(solution - target) < min_diff
                min_diff = abs(solution - target)
                answer = a * b
            end
        end
    end
    answer
end
