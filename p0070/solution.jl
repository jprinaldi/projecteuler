using DataStructures
using Primes

function are_perms(x, y)
    counter(string(x)) == counter(string(y))
end

function solve()
    min_ratio = Inf
    min_ratio_n = nothing
    for n in 2:(10^7 - 1)
        if are_perms(n, totient(n))
            ratio = n / totient(n)
            if ratio < min_ratio
                min_ratio = ratio
                min_ratio_n = n
            end
        end
    end
    min_ratio_n
end
