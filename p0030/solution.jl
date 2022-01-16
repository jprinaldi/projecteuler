function solve()
    total_sum = 0
    for n in 2:10^6
        if sum(map(x -> x^5, digits(n))) == n
            total_sum += n
        end
    end
    total_sum
end
