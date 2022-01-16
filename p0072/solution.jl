using Primes

function solve(upper_bound=1_000_000)
    sum(totient(d) for d in 2:upper_bound)
end
