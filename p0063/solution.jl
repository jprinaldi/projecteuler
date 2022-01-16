function solve()
    count = 1
    for a in 2:12
        for n in 1:49
            (ndigits(big(a)^n) == n) && (count += 1)
        end
    end
    return count
end
