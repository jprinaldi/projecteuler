using DataStructures

function solve()
    x = 1
    while true
        c1 = counter(string(x))
        c2 = counter(string(2 * x))
        c3 = counter(string(3 * x))
        c4 = counter(string(4 * x))
        c5 = counter(string(5 * x))
        c6 = counter(string(6 * x))
        if c1 == c2 && c1 == c3 && c1 == c4 && c1 == c5 && c1 == c6
            return x
        end
        x += 1
    end
end
