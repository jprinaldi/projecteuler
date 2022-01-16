function solve(upper_bound_a=10^3)
    total = 0
    for a in 3:upper_bound_a
        n = iseven(a) ? div(a, 2) - 1 : div(a - 1, 2)
        total += a * n
    end
    return 2 * total
end
