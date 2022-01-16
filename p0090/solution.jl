using Combinatorics

function check(ds, c1, c2)
    return (ds[1] ∈ c1 && ds[2] ∈ c2) || (ds[1] ∈ c2 && ds[2] ∈ c1)
end

function solve()
    total = 0
    for c1 in combinations(0:9, 6)
        for c2 in combinations(0:9, 6)
            if 6 ∈ c1 || 9 ∈ c1
                union!(c1, [6, 9])
            end
            if 6 ∈ c2 || 9 ∈ c2
                union!(c2, [6, 9])
            end
            flag = true
            for sq in (i^2 for i in 1:9)
                ds = map(x -> parse(Int, x), collect(lpad(sq, 2, "0")))
                if !check(ds, c1, c2)
                    flag = false
                end
            end
            if flag
                total += 1
            end
        end
    end
    # Because we count each possibility twice, we divide the total by 2.
    return div(total, 2)
end
