using Base.Iterators
using Combinatorics

function solve()
    ds = 1:9
    available_ops = [+, -, *, /]
    longest_set_length = 0
    answer = nothing
    for comb in combinations(ds, 4)
        computed_integers = Set()
        for perm in permutations(comb)
            for order in [(1, 1), (1, 2), (2, 1), (2, 2), (3, 1), (3, 2)]
                for ops in product(available_ops, available_ops, available_ops)
                    n1 = reduce(ops[1], perm[order[1]:order[1] + 1])
                    perm2 = vcat(perm[1:order[1] - 1], [n1], perm[order[1] + 2:end])
                    n2 = reduce(ops[2], perm2[order[2]:order[2] + 1])
                    perm3 = vcat(perm2[1:order[2] - 1], [n2], perm2[order[2] + 2:end])
                    n3 = reduce(ops[3], perm3[1:2])
                    isinteger(n3) && push!(computed_integers, n3)
                end
            end
        end
        n = 0
        while n ∈ computed_integers
            n += 1
        end
        if n > longest_set_length
            longest_set_length = n
            answer = join(comb)
        end
    end
    return answer
end
