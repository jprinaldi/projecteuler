function approx(cf)
    length(cf) == 1 && return cf[1]
    return cf[1] + 1 // approx(cf[2:end])
end

function convergent(n)
    cf = [big(2), big(1)]
    for k in 1:div(n, 3)
        append!(cf, [2 * k, 1, 1])
    end
    return approx(cf[1:n])
end

function solve(n=100)
    sum(digits(numerator(convergent(n))))
end
