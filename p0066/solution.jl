function pell(n)
    x = BigInt(floor(sqrt(n)))
    y, z, r = x, BigInt(1), x << 1
    e1, e2, f1, f2 = BigInt(1), BigInt(0), BigInt(0), BigInt(1)
    while true
        y = r * z - y
        z = div(n - y * y, z)
        r = div(x + y, z)
        e1, e2 = e2, e2 * r + e1
        f1, f2 = f2, f2 * r + f1
        a, b = f2, e2
        b, a = a, a * x + b
        if a * a - n * b * b == 1
            return a, b
        end
    end
end

function isperfectsquare(x)
    isqrt(x)^2 == x
end

function solve(upper_bound=20)
    max_x = 0
    result = nothing
    for d in filter(x -> !isperfectsquare(x), 2:upper_bound)
        x, y = pell(d)
        if x > max_x
            max_x = x
            result = d
        end
        max_x = max(max_x, x)
    end
    return result
end
