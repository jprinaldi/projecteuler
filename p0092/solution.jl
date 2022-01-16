function chain_loop(n)
    while n != 1 && n != 89
        n = sum(map(x -> x^2, digits(n)))
    end
    n
end

function solve(n)
    count_89 = 0
    for n in 1:(n - 1)
        if chain_loop(n) == 89
            count_89 += 1
        end
    end
    count_89
end
