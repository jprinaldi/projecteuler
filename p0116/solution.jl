function solve(target=50, lengths=2:4)
    memo = Dict()
    for l in lengths
        memo[l] = zeros(Int, target)
        memo[l][l] = 1
        for n in (l + 1):target
            memo[l][n] = n - l + 1 + sum(memo[l][k] for k in 1:(n - l))
        end
    end
    return sum(memo[l][target] for l in lengths)
end
