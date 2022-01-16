function ispalindrome(n)
    digits(n) == reverse(digits(n))
end

function isperfectsquare(x)
    isqrt(x)^2 == x
end

function solve(upper_bound=10^8)
    total = 0
    scs = accumulate(+, (i^2 for i in 0:isqrt(upper_bound)))
    target_set = Set()
    for i in 3:lastindex(scs)
        for j in 1:(i - 2)
            n = scs[i] - scs[j]
            if ispalindrome(n) && n < upper_bound
                push!(target_set, n)
            end
        end
    end
    return sum(target_set)
end
