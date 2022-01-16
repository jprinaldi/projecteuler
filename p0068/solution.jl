using Combinatorics

function is3gonring(r)
    r[1] + r[2] + r[3] == r[4] + r[3] + r[5] == r[6] + r[5] + r[2]
end

function is5gonring(r)
    r[1] + r[2] + r[3] == r[4] + r[3] + r[5] == r[6] + r[5] + r[7] == r[8] + r[7] + r[9] == r[10] + r[9] + r[2]
end

function solution3gon(r)
    s1 = [r[1], r[2], r[3]]
    s2 = [r[4], r[3], r[5]]
    s3 = [r[6], r[5], r[2]]
    m = min(r[1], r[4], r[6])
    if r[1] == m
        return parse(Int, join(vcat(s1, s2, s3)))
    elseif r[4] == m
        return parse(Int, join(vcat(s2, s3, s1)))
    else
        return parse(Int, join(vcat(s3, s1, s2)))
    end
end

function solution5gon(r)
    s1 = [r[1], r[2], r[3]]
    s2 = [r[4], r[3], r[5]]
    s3 = [r[6], r[5], r[7]]
    s4 = [r[8], r[7], r[9]]
    s5 = [r[10], r[9], r[2]]
    m = min(r[1], r[4], r[6], r[8], r[10])
    if r[1] == m
        return parse(Int, join(vcat(s1, s2, s3, s4, s5)))
    elseif r[4] == m
        return parse(Int, join(vcat(s2, s3, s4, s5, s1)))
    elseif r[6] == m
        return parse(Int, join(vcat(s3, s4, s5, s1, s2)))
    elseif r[8] == m
        return parse(Int, join(vcat(s4, s5, s1, s2, s3)))
    else
        return parse(Int, join(vcat(s5, s1, s2, s3, s4)))
    end
end

function solve()
    solutions16 = Set()
    for ring in permutations(1:10)
        if is5gonring(ring)
            solution = solution5gon(ring)
            if length(digits(solution)) == 16
                push!(solutions16, solution5gon(ring))
            end
        end
    end
    return maximum(solutions16)
end
