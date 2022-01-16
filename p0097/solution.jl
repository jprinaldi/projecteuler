function solve(n)
    last_digits = 1
    for i in 1:n
        last_digits = (last_digits * 2) % 10^10
    end
    (last_digits * 28433 + 1) % 10^10
end
