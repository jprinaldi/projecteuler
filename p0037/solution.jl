using Primes

function is_truncatable_prime(prime)
    prime_digits = digits(prime)
    for cut in 1:lastindex(prime_digits)
        right_cut_number = sum(x * 10^(i - 1) for (i, x) in enumerate(prime_digits[cut:end]))
        left_cut_number = sum(x * 10^(i - 1) for (i, x) in enumerate(prime_digits[1:cut]))
        if !isprime(right_cut_number) || !isprime(left_cut_number)
            return false
        end
    end
    return true
end

function solve()
    truncatable_primes_count = 0
    total_sum = 0
    prime = 11
    while truncatable_primes_count < 11
        if is_truncatable_prime(prime)
            total_sum += prime
            truncatable_primes_count += 1
        end
        prime = nextprime(prime + 2)
    end
    total_sum
end
