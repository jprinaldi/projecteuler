function triangle(n)::Int
    n * (n + 1) / 2
end

function pentagonal(n)::Int
    n * (3 * n - 1) / 2
end

function hexagonal(n)::Int
    n * (2 * n - 1)
end

function solve(start=285)
    triangles = Set()
    pentagonals = Set()
    hexagonals = Set()
    n = start
    while true
        t = triangle(n)
        p = pentagonal(n)
        h = hexagonal(n)
        push!(triangles, t)
        push!(pentagonals, p)
        push!(hexagonals, h)
        if t ∈ pentagonals && t ∈ hexagonals
            return t
        end
        n += 1
    end
end
