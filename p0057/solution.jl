function solve(num_iterations=1_000)
    approx = big(1)
    target_count = 0
    for it = 1:num_iterations
        approx = 1 + 1 // (1 + approx)
        if ndigits(numerator(approx)) > ndigits(denominator(approx))
            target_count += 1
        end
    end
    return target_count
end
