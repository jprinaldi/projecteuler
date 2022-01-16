function isperfectsquare(n)
    isqrt(n)^2 == n
end

function s(n)
    m = BigFloat(sqrt(big(n)), precision=512)
    s = string(m)
    return parse(Int, s[1]) + sum(digits(parse(BigInt, s[3:101])))
end

function solve(N=100)
    sum(s(n) for n in filter(x -> !isperfectsquare(x), 1:N))
end
