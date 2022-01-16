using Primes

function ndivisors(n)
    factors = Primes.factor(n)
    prod(map(x -> x + 1, values(factors)))
end

function solve(upper_bound=10^7)
    count = 0
    for n in 2:upper_bound
        if ndivisors(n) == ndivisors(n + 1)
            count += 1
        end
    end
    return count
end
