function solve(d_upper_bound)
    proper_fractions = Set()
    for d in 1:d_upper_bound
        for n in 1:(d - 1)
            push!(proper_fractions, n // d)
        end
    end
    length(filter(x -> x > 1 // 3 && x < 1 // 2, proper_fractions))
end
