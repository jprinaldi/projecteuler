function q(n, modulo=10^6, memo=[])
    push!(memo, Array{Int32}(undef, n))
    for k in 1:n
        if n == k
            left = 1
        elseif (n - k) < k
            left = memo[n - k][n - k]
        else
            left = memo[n - k][k]
        end

        if k == 1
            right = 0
        else
            right = memo[n][k - 1]
        end

        value = (left + right) % modulo
        memo[n][k] = value
    end
    return memo[n][n]
end

function p(m, modulo=10^6, memo=[])
    for n in 1:m
        q(n, modulo, memo)
    end
    return memo[m][m]
end

function solve(target=10^6)
    memo = []
    n = 1
    while q(n, target, memo) != 0
        n += 1
    end
    return n
end
