using Primes

function solve(upper_bound)
    primes_2_upper_bound = trunc(Int, sqrt(upper_bound - 24))
    primes_3_upper_bound = trunc(Int, cbrt(upper_bound - 20))
    primes_4_upper_bound = trunc(Int, (upper_bound - 12)^(1 / 4))
    primes_2 = primes(primes_2_upper_bound)
    primes_3 = primes(primes_3_upper_bound)
    primes_4 = primes(primes_4_upper_bound)
    numbers = Set()
    for p2 in primes_2
        for p3 in primes_3
            for p4 in primes_4
                number = p2^2 + p3^3 + p4^4
                if number < upper_bound
                    push!(numbers, number)
                end
            end
        end
    end
    length(numbers)
end
