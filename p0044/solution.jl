using Combinatorics

function solve()
    min_diff::Int = typemax(Int)
    pentagonal_numbers_array = [n * (3 * n - 1) / 2 for n in 1:10^4]
    pentagonal_numbers_set = Set(pentagonal_numbers_array)
    for (index, combination) in enumerate(combinations(pentagonal_numbers_array, 2))
        diff = abs(combination[1] - combination[2])
        if sum(combination) in pentagonal_numbers_set && diff in pentagonal_numbers_set
            min_diff = min(min_diff, diff)
        end
    end
    min_diff
end
