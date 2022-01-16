using Combinatorics
using Primes

function replace(n::Int, digit::Int, positions)::Int
    digits_n = reverse(digits(n))
    for p in positions
        digits_n[p] = digit
    end
    parse(Int, join(digits_n))
end

function solve(target_count=8)
    n = 2
    while true
        num_digits = length(digits(n))
        for positions in combinations(1:num_digits - 1)
            prime_count = 0
            for digit in 0:9
                if first(positions) == 1 && digit == 0
                    continue
                end
                m = replace(n, digit, positions)
                prime_count += Int(isprime(m))
            end
            if prime_count == target_count
                return n
            end
        end
        n = nextprime(n + 1)
    end
end
