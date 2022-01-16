using Primes

function solve()
    for a in 1000:9999
        for d in 1:(floor(Int, (9999 - a) / 2))
            if a == 1487 && d == 3330
                continue
            end
            if isprime(a) && isprime(a + d) && isprime(a + 2 * d)
                if Set(digits(a)) == Set(digits(a + d)) && Set(digits(a)) == Set(digits(a + 2 * d))
                    return parse(Int, join([a, a + d, a + 2 * d]))
                end
            end
        end
    end
end
