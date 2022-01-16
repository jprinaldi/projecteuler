function solve(upper_bound_exponent)
    d = []
    n = 1
    while length(d) < 10^upper_bound_exponent
        append!(d, reverse(digits(n)))
        n += 1
    end
    prod(d[10^i] for i in 0:upper_bound_exponent)
end
