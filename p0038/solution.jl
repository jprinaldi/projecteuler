function is9pandigital(n)
    digits_n = digits(n)
    length(digits_n) == 9 && all(x in digits_n for x in 1:9)
end

function solve()
    max_pandigital = 0
    for x in 1:10^4
        for n in 1:9
            construction = parse(BigInt, join(map(d -> string(x * d), [d for d in 1:n])))
            if is9pandigital(construction)
                max_pandigital = max(max_pandigital, construction)
            end
        end
    end
    max_pandigital
end
