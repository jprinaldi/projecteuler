using Combinatorics
using Primes

function dton(digits, base=10)
    sum(digits[k] * base^(k - 1) for k in 1:length(digits))
end

function nways(partition)
    prod(count(perm -> isprime(dton(perm)), permutations(part)) for part in partition)
end

function solve(n=123456789)
    sum(nways(partition) for partition in partitions(digits(n)))
end
