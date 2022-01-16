function s(n, k, memo)::Int
    if (n, k) in keys(memo)
        return memo[(n, k)]
    elseif n < 0
        return 0
    elseif n == 0
        return 1
    elseif k == 0
        return 0
    end
    memo[(n, k)] = s(n - k, k, memo) + s(n, k - 1, memo)
    return memo[(n, k)]
end

function s(n, k)::Int
    memo = Dict()
    s(n, k, memo)
end

function solve(n)::Int
    s(n, n) - 1
end
