function isperfectsquare(n)
    return isqrt(n)^2 == n
end

function solve(high=10^9)
    answer::Int64 = 0
    for a::UInt64 in 3:2:(high - 1) / 3
        for k in [1,-1]
            b = a + k
            perimeter = *(a, 3) + k
            s = perimeter / 2
            if isperfectsquare(widemul(2 * a + b, 2 * a - b))
                answer += perimeter
            end
        end
    end
    return answer
end
