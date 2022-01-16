using Primes

function issquarefree(n)
    for p in primes(isqrt(n))
        if n % p^2 == 0
            return false
        end
    end
    return true
end

function solve(N=51)
    numbers = Set()
    for n in 0:(N - 1)
        for k in 0:n
            push!(numbers, binomial(n, k))
        end
    end
    return sum(filter(n -> issquarefree(n), numbers))
end
