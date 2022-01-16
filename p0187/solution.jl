using Primes

function solve(upper_bound=10^8)
    count = 0
    for n in 2:(upper_bound - 1)
        (n % 10^6 == 0) && println(n)
        factors = factor(n)
        (sum(values(factors)) == 2) && (count += 1)
    end
    return count
end
