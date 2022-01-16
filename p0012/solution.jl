using Primes

function ndivisors(n)
    factors = Primes.factor(n)
    prod(map(x -> x + 1, values(factors)))
end

function get_triangular_number(n)::Int
    n * (n + 1) / 2
end

function solve()
    n = 1
    num_divisors = 1
    triangular_number = 1
    while num_divisors <= 500
        n += 1
        triangular_number = get_triangular_number(n)
        num_divisors = ndivisors(triangular_number)
    end
    return triangular_number
end
