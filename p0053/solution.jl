function solve()
    total_count = 0
    for n in 1:100
        for r in 1:n
            if binomial(big(n), r) > 10^6
                total_count += 1
            end
        end
    end
    return total_count
end
