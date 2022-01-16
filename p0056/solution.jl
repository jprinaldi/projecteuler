function solve(upper_bound=100)
    max_digital_sum = 0
    for a in 1:(upper_bound - 1)
        for b in 1:(upper_bound - 1)
            max_digital_sum = max(max_digital_sum, sum(digits(big(a)^b)))
        end
    end
    max_digital_sum
end
