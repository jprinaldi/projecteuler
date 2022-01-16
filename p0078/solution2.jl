function g(k)
    div(k * (3k - 1), 2)
end

function p(n, modulo=10^6, memo=Dict(0 => 1))
    total = 0
    k = 1
    for i in [1, -1]
        k = i
        while g(k) <= n
            if haskey(memo, n - g(k))
                factor = memo[n - g(k)]
            else
                factor = p(n - g(k), modulo, memo)
            end
            total += (-1)^(k - 1) * factor
            total %= modulo
            k += i
        end
    end
    memo[n] = total
    return total
end

function solve(target=10^6)
    memo = Dict(0 => 1)
    n = 1
    while p(n, target, memo) != 0
        n += 1
    end
    return n
end
