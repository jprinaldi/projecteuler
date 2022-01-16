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

function is_abundant(n)
    sum_divisors(n) > n
end

function get_abundant_numbers()
    abundant_numbers = Set()
    for n in 1:28123
        if is_abundant(n)
            push!(abundant_numbers, n)
        end
    end
    abundant_numbers
end

function solve()
    abundant_numbers = get_abundant_numbers()
    target_numbers = []
    for n in 1:28123
        can_be_constructed = false
        for abundant_number in abundant_numbers
            if (n - abundant_number) in abundant_numbers
                can_be_constructed = true
                break
            end
        end
        if !can_be_constructed
            push!(target_numbers, n)
        end
    end
    sum(target_numbers)
end
