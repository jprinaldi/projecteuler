using Primes

function solve(upper_bound)
    max_ratio = 0
    answer = nothing
    for n in 1:upper_bound
        ratio = n / totient(n)
        if ratio > max_ratio
            max_ratio = ratio
            answer = n
        end
    end
    answer
end
