using Primes

function rad(n)
    prod(keys(factor(n)))
end

function solve(upper_bound=10^5, target=10^4)
    radicals = collect((rad(n), n) for n in 1:upper_bound)
    last(sort(radicals)[target])
end
