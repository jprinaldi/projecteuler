using Primes

function solve(threshold=10^6)
    total = 0
    p1 = 5
    p2 = 7
    d1 = floor(Int, log10(p1)) + 1
    while p1 <= threshold
        x = 1
        while (10^d1 * x) % p2 != p2 - p1
            x += 1
        end
        s = 10^d1 * x + p1
        total += s
        p1 = p2
        p2 = nextprime(p1 + 1)
        d1 = floor(Int, log10(p1)) + 1
    end
    return total
end
