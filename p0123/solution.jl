using Primes

function solve(threshold=10^10)
    n, r, p = 0, 0, 0
    while r <= threshold
        n += 1
        p = nextprime(p + 1)
        left = ((n * p * (-1)^(n - 1) + (-1)^n) % p^2)
        right = ((n * p + 1) % p^2)
        r = (left + right) % p^2
    end
    return n
end
