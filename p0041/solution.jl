using Primes

function ispandigital(n)
    digits_n = digits(n)
    all(x in digits_n for x in 1:length(digits_n))
end

function solve()
    target_n = 0
    for n in 1:1_000_000_000
        if isprime(n) && ispandigital(n)
            target_n = max(target_n, n)
        end
    end
    target_n
end
