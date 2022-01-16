using Primes

function digits_to_int(digits)
    sum(10^(i - 1) * x for (i, x) in enumerate(digits))
end

function rotations(n)
    digits_n = digits(n)
    num_digits = length(digits_n)
    digit_rotations = [circshift(digits_n, i) for i in 1:num_digits]
    map(x -> digits_to_int(x), rot for rot in digit_rotations)
end

function solve(upper_bound)
    circular_primes_count = 0
    for prime in primes(upper_bound)
        if all(x -> isprime(x), rotations(prime))
            circular_primes_count += 1
        end
    end
    circular_primes_count
end
