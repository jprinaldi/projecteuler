using Combinatorics
using Primes

function haveprop(prime_list)
    for comb in combinations(collect(prime_list), 2)
        if !isprime(parse(Int, join(comb))) || !isprime(parse(Int, join(reverse(comb))))
            return false
        end
    end
    return true
end

function solve()
    primes_upper_bound = 10_000
    the_primes = filter(x -> !(x in [2, 5]), primes(primes_upper_bound))
    min_sum = Inf
    remarkable_primes = Dict()
    remarkable_primes[2] = Set()
    for comb in combinations(the_primes, 2)
        if haveprop(comb)
            push!(remarkable_primes[2], Set(comb))
        end
    end
    for n in 3:5
        remarkable_primes[n] = Set()
        for prime in the_primes
            for comb in remarkable_primes[n - 1]
                prime_list = push!(copy(comb), prime)
                if length(prime_list) == n && haveprop(prime_list)
                    push!(remarkable_primes[n], prime_list)
                end
            end
        end
    end
    minimum(x -> sum(x), remarkable_primes[5])
end
