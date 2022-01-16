using DataStructures

function isposint(n)
    n > 0 && floor(n) == n
end

function solve(upper_bound)
    counts = DefaultDict(0)
    sides = Set()
    for L in 1:upper_bound
        a = 1
        while a < floor(L / 2)
            b = (2 * L * a - L^2) / (2 * (a - L))
            c = sqrt(a^2 + b^2)
            if isposint(b) && isposint(c) && !(Set([a, b, c]) in sides)
                counts[L] += 1
                push!(sides, Set([a, b, c]))
            end
            a += 1
        end
    end
    target_count = 0
    for count in values(counts)
        if count == 1
            target_count += 1
        end
    end
    target_count
end
