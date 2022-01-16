function solve(threshold=1_000)
    n = 2
    while true
        solution_count = 0
        for x in (n + 1):2 * n
            y = x * n / (x - n)
            if isinteger(y)
                solution_count += 1
                if solution_count > threshold
                    return n
                end
            end
        end
        n += 1
    end
end
