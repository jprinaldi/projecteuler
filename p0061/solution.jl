using Combinatorics
using LightGraphs

function triangle(n)::Int
    n * (n + 1) / 2
end

function square(n)::Int
    n^2
end

function pentagonal(n)::Int
    n * (3 * n - 1) / 2
end

function hexagonal(n)::Int
    n * (2 * n - 1)
end

function heptagonal(n)::Int
    n * (5 * n - 3) / 2
end

function octagonal(n)::Int
    n * (3 * n - 2)
end

function left(n)::Int
    trunc(Int, n / 100)
end

function right(n)::Int
    n % 100
end

function solve(cycle_length=6)
    ps = Dict()
    ps[3] = Set()
    ps[4] = Set()
    ps[5] = Set()
    ps[6] = Set()
    ps[7] = Set()
    ps[8] = Set()
    n = 19
    while triangle(n) < 10^5
        if 10^3 <= triangle(n) < 10^4
            push!(ps[3], triangle(n))
        end
        if 10^3 <= square(n) < 10^4
            push!(ps[4], square(n))
        end
        if 10^3 <= pentagonal(n) < 10^4
            push!(ps[5], pentagonal(n))
        end
        if 10^3 <= hexagonal(n) < 10^4
            push!(ps[6], hexagonal(n))
        end
        if 10^3 <= heptagonal(n) < 10^4
            push!(ps[7], heptagonal(n))
        end
        if 10^3 <= octagonal(n) < 10^4
            push!(ps[8], octagonal(n))
        end
        n += 1
    end

    g = SimpleDiGraph(100)
    for k in 3:8
        for n in ps[k]
            source = left(n)
            target = right(n)
            add_edge!(g, source + 1, target + 1)
        end
    end

    cycles = filter(x -> length(x) == cycle_length, simplecycles_limited_length(g, cycle_length))
    for cycle in cycles
        cycle = map(x -> x - 1, cycle)
        shifted_cycle = circshift(cycle, 1)
        zipped_cycle = zip(shifted_cycle, cycle)
        edges = map(x -> parse(Int, join([string(first(x)), string(last(x))])), zipped_cycle)
        for edges_perm in permutations(edges)
            if all(edges_perm[k] in ps[k + 2] for k in 1:cycle_length)
                return sum(edges)
            end
        end
    end
end
