function solve()
    total_sum = 0
    for n in 3:2_540_160
        if n == sum(map(x -> factorial(x), digits(n)))
            total_sum += n
        end
    end
    return total_sum
end
