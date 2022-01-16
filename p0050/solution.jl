using Primes

function solve()
    prime_upper_bound = 1_000_000
    the_primes = primes(prime_upper_bound)
    largest_prime = last(the_primes)
    largest_window_size = 0
    target_prime = nothing
    for window_size = 2:prime_upper_bound
        for start = 1:lastindex(the_primes) - window_size - 1
            window_primes = the_primes[start:start + window_size]
            if sum(window_primes) > largest_prime
                break
            end
            if sum(window_primes) in the_primes
                if window_size > largest_window_size
                    largest_window_size = window_size
                    target_prime = sum(window_primes)
                end
            end
        end
    end
    return target_prime
end
