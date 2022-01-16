using Combinatorics
using Primes

function get_divisors(n)
    factors = Primes.factor(n)
    factors_array = []
    for (factor, count) in factors
        for _ in 1:count
            push!(factors_array, factor)
        end
    end
    divisors = Set([prod(x) for x in combinations(factors_array)])
    delete!(divisors, n)
    push!(divisors, 1)
    divisors
end

function sum_divisors(n)
    sum(get_divisors(n))
end

function is_amicable(n)
    divisors_sum = sum_divisors(n)
    return divisors_sum != n && sum_divisors(divisors_sum) == n
end

function solve()
    amicable_numbers = []
    for n in 1:9_999
        if is_amicable(n)
            push!(amicable_numbers, n)
        end
    end
    sum(amicable_numbers)
end
