using DataStructures

function read(tree_size)
    tree = Dict()
    for i in 1:tree_size
        tree[i] = Dict()
        row = [parse(Int, x) for x in split(readline())]
        for (j, value) in enumerate(row)
            tree[i][j] = value
        end
    end
    tree
end

function solve(tree_size=15)
    tree = read(tree_size)
    accumulator_tree = Dict()
    accumulator_tree[1] = DefaultDict(0)
    accumulator_tree[1][1] = tree[1][1]
    for i in 2:tree_size
        accumulator_tree[i] = DefaultDict(0)
        row = tree[i]
        for (j, value) in row
            accumulator_tree[i][j] = max(accumulator_tree[i - 1][j - 1], accumulator_tree[i - 1][j]) + value
        end
    end
    maximum(values(accumulator_tree[tree_size]))
end

println(solve())
