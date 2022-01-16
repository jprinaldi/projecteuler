function solve(upper_bound=1_000_000)
    max_value = 0
    for d in 1:upper_bound
        for n in ceil(max_value * d):(ceil((3 // 7) * d) - 1)
            max_value = max(max_value, n // d)
        end
    end
    numerator(max_value)
end
