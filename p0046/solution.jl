using Primes

function isint(n)
    floor(n) == n
end

function goldbach_conjecture_holds(n)
    for prime in primes(n - 1)
        if isint(sqrt((n - prime) / 2))
            return true
        end
    end
    return false
end

function solve()
    n = 9
    while goldbach_conjecture_holds(n)
        n += 2
        while isprime(n)
            n += 2
        end
    end
    n
end
