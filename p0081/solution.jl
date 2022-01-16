function read_matrix(num_rows)
    matrix = []
    for _ in 1:num_rows
        row = map(x -> parse(Int, x), split(readline(), ','))
        push!(matrix, row)
    end
    matrix
end

function solve(n)
    matrix = read_matrix(n)
    for i in 2:n
        matrix[i][1] += matrix[i - 1][1]
        matrix[1][i] += matrix[1][i - 1]
    end
    for i in 2:n
        for j in 2:n
            matrix[i][j] += min(matrix[i - 1][j], matrix[i][j - 1])
        end
    end
    matrix[n][n]
end

println(solve(80))
