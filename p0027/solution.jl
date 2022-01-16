using Primes

function quadratic(a, b, n)
    n^2 + a * n + b
end

function solve()
    max_prime_count = 0
    max_prime_count_a = nothing
    max_prime_count_b = nothing
    for a in -999:999
        for b in -1000:1000
            n = 0
            prime_count = 0
            while isprime(quadratic(a, b, n))
                n += 1
                prime_count += 1
            end
            if prime_count > max_prime_count
                max_prime_count = prime_count
                max_prime_count_a = a
                max_prime_count_b = b
            end
        end
    end
    max_prime_count_a * max_prime_count_b
end
