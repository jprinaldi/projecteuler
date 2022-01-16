function d(a, b, c)
    x -> sqrt(a^2 + x^2) + sqrt(b^2 + (c - x)^2)
end

function getx(a, b, c)
    (a == b) && return c // 2
    a * c // (a + b)
end

function solve(threshold=10^6)
    M = 0
    solutions = Dict(0 => 0)
    while solutions[M] <= threshold
        M += 1
        num_cuboids = 0
        a = M
        for b in 1:a
            for c in 1:b # a >= b >= c
                f = d(b, c, a)
                x = getx(b, c, a)
                if abs(f(x) - round(f(x))) < 0.0001
                    num_cuboids += 1
                end
            end
        end
        solutions[M] = solutions[M - 1] + num_cuboids
        println("$M $(solutions[M])")
    end
    return M
end
