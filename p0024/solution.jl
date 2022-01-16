using Combinatorics
using Base.Iterators

function solve()
    join(first(drop(permutations("0123456789"), 10^6 - 1)))
end
