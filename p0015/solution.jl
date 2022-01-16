function get_num_paths(grid_size)::Int
    num_paths = 0
    for n in 1:grid_size
        num_paths += n * (n + 1) * (n + 2) / 6
    end
    num_paths
end

function solve_aux(i, j, memo)::BigInt
    if i == 1 || j == 1
        return big(1)
    elseif haskey(memo, (i, j))
        return memo[(i, j)]
    end
    solution = solve_aux(i - 1, j, memo) + solve_aux(i, j - 1, memo)
    memo[(i, j)] = solution
    solution
end

function solve(i=10^3, j=10^3)
    memo = Dict()
    return solve_aux(i, j, memo)
end
