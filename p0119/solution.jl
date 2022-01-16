using DataStructures

function solve(high_b=100, high_e=9)
    powers = DefaultDict(Set)
    for b in 2:high_b
        for e in 1:high_e
            power = big(b)^e
            (power > 9) && push!(powers[b], power)
        end
    end
    a = []
    for b in 1:high_b
        for power in powers[b]
            (sum(digits(power)) == b) && push!(a, power)
        end
    end
    return sort(a)[30]
end
