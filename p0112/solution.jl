function isbouncy(n)
    decreased = false
    increased = false
    ds = digits(n)
    for i in 2:lastindex(ds)
        if ds[i] > ds[i - 1]
            increased = true
            decreased && return true
        elseif ds[i] < ds[i - 1]
            decreased = true
            increased && return true
        end
    end
    return false
end

function solve(target_ratio=0.99)
    bouncy_count = 0
    n = 100
    while bouncy_count / n != target_ratio
        n += 1
        isbouncy(n) && (bouncy_count += 1)
    end
    return n
end
