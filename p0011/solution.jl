function read(grid_size)
    grid = []
    for _ in 1:grid_size
        row = [parse(Int, x) for x in split(readline())]
        push!(grid, row)
    end
    grid
end

function get_row_prod(grid_size::Int, grid, i::Int, j::Int)::Int
    if j + 3 > grid_size
        return 0
    end
    grid[i][j] * grid[i][j + 1] * grid[i][j + 2] * grid[i][j + 3]
end

function get_col_prod(grid_size::Int, grid, i::Int, j::Int)::Int
    if i + 3 > grid_size
        return 0
    end
    grid[i][j] * grid[i + 1][j] * grid[i + 2][j] * grid[i + 3][j]
end

function get_diag_prod(grid_size::Int, grid, i::Int, j::Int)::Int
    if i + 3 > grid_size || j + 3 > grid_size
        return 0
    end
    grid[i][j] * grid[i + 1][j + 1] * grid[i + 2][j + 2] * grid[i + 3][j + 3]
end

function get_rev_diag_prod(grid_size::Int, grid, i::Int, j::Int)::Int
    if i + 3 > grid_size || j - 3 < 1
        return 0
    end
    grid[i][j] * grid[i + 1][j - 1] * grid[i + 2][j - 2] * grid[i + 3][j - 3]
end

function solve()
    grid_size = 20
    grid = read(grid_size)
    max_prod = 0
    for i in 1:grid_size
        for j in 1:grid_size
            row_prod = get_row_prod(grid_size, grid, i, j)
            col_prod = get_col_prod(grid_size, grid, i, j)
            diag_prod = get_diag_prod(grid_size, grid, i, j)
            rev_diag_prod = get_rev_diag_prod(grid_size, grid, i, j)
            max_prod = max(max_prod, row_prod, col_prod, diag_prod, rev_diag_prod)
        end
    end
    max_prod
end

println(solve())
