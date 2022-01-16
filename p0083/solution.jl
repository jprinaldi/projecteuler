function read_matrix(num_rows)
    rows = []
    open("p0083/input.txt", "r") do io
        for _ in 1:num_rows
            row = transpose(map(x -> parse(Int, x), split(readline(io), ',')))
            push!(rows, row)
        end
    end;
    reduce(vcat, rows)
end

function get_neighbors(n, node)
    i, j = first(node), last(node)
    filter(x -> first(x) >= 1 && last(x) >= 1 && first(x) <= n && last(x) <= n, [(i - 1, j), (i, j - 1), (i + 1, j), (i, j + 1)])
end

function dijsktra(matrix)
    n = first(size(matrix))
    visited = Set()
    paths = fill(Inf, n, n)
    ci, cj = 1, 1
    paths[ci, cj] = matrix[ci, cj]
    queue = [(ci, cj)]
    while length(queue) > 0
        sort!(queue, by=x -> paths[first(x),last(x)], rev=true)
        ci, cj = pop!(queue)
        for (ni, nj) in get_neighbors(n, (ci, cj))
            if (ni, nj) in visited
                continue
            end
            paths[ni, nj] = min(paths[ni, nj], paths[ci, cj] + matrix[ni, nj])
            if !((ni, nj) in queue)
                push!(queue, (ni, nj))
            end
        end
        push!(visited, (ci, cj))
    end
    paths
end

function solve(n)
    matrix = read_matrix(n)
    paths = dijsktra(matrix)
    paths[n, n]
end
