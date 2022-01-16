using Primes

function distinct_factors_count(n)
    length(keys(factor(n)))
end

function solve(target_count)
    consecutive_count = 0
    n = 2
    while true
        if distinct_factors_count(n) == target_count
            consecutive_count += 1
            if consecutive_count == target_count
                return n - target_count + 1
            end
        else
            consecutive_count = 0
        end
        n += 1
    end
end
