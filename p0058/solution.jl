using Primes

function solve(threshold=0.1)
    diagonal_numbers = [1]
    prime_diagonal_numbers_count = 0
    layer = 1
    while true
        new_diagonal_numbers = [last(diagonal_numbers) + 2 * layer * i for i in 1:4]
        append!(diagonal_numbers, new_diagonal_numbers)
        prime_diagonal_numbers_count += count(x -> isprime(x), new_diagonal_numbers)
        if prime_diagonal_numbers_count / length(diagonal_numbers) < threshold
            return 2 * layer + 1
        end
        layer += 1
    end
end
