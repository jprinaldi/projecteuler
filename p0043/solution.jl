using Combinatorics

function digits_to_int(digits)
    n = length(digits)
    sum(10^(n - i) * d for (i, d) in enumerate(digits))
end

function solve()
    primes = [2,3,5,7,11,13,17]
    target_sum = 0
    for perm in filter(x -> first(x) != 0, collect(permutations(0:9)))
        has_property = true
        for (start, prime) in enumerate(primes)
            if digits_to_int(perm[start + 1:start + 3]) % prime != 0
                has_property = false
            end
        end
        if has_property
            target_sum += digits_to_int(perm)
        end
    end
    target_sum
end
