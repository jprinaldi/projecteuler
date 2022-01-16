using Combinatorics
using Primes

function solve(threshold=4_000_000)::BigInt
    n2threshold = 2 * (threshold - 1)
    prev_min_n = nothing
    f_upper_bound = 3
    while true
        min_n = Inf
        factors = 3:2:f_upper_bound
        for s in 1:floor(Int, log(n2threshold) / log(3))
            for comb in with_replacement_combinations(factors, s)
                if prod(comb) >= n2threshold
                    n = prod((prime(i)^((f - 1) / 2) for (i, f) in enumerate(sort(comb, rev=true))))
                    min_n = min(min_n, n)
                end
            end
        end
        if prev_min_n == min_n
            return prev_min_n
        else
            prev_min_n = min_n
            f_upper_bound += 2
        end
    end
end
