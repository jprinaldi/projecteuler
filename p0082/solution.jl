function read_matrix(num_rows)
    rows = []
    for _ in 1:num_rows
        row = transpose(map(x -> parse(Int, x), split(readline(), ',')))
        push!(rows, row)
    end
    reduce(vcat, rows)
end

function solve_col(matrix, col)
    n = first(size(matrix))
    for row in 1:n
        min_path = Inf
        if row == 1
            min_path = matrix[row, col - 1]
        else
            min_path = min(matrix[row, col - 1], matrix[row - 1, col])
        end
        for start in row:n
            current_path = matrix[start, col - 1] + sum(matrix[row + 1:start, col])
            min_path = min(min_path, current_path)
        end
        matrix[row, col] += min_path
    end
end

function solve(n)
    matrix = read_matrix(n)
    for col in 2:n
        solve_col(matrix, col)
    end
    minimum(matrix[:, n])
end

println(solve(80))
