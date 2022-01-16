function solve()
    n = 10^9
    while true
        square = n^2
        if all(k -> digits(n^2)[2 * k - 1] == (11 - k) % 10, 1:10)
            return n
        end
        n += 1
    end
end
