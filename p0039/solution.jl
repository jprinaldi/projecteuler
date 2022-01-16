function isint(n::Number)::Bool
    floor(n) == n
end

function solve()
    max_num_solutions = 0
    max_num_solutions_p = nothing
    for p in 1:1_000
        num_solutions = 0
        for a in 1:p
            for b in 1:p
                c = p - a - b
                if c^2 == a^2 + b^2 && (a + b) > c && (a + c) > b && (b + c) > a
                    num_solutions += 1
                end
            end
        end
        if num_solutions > max_num_solutions
            max_num_solutions = num_solutions
            max_num_solutions_p = p
        end
    end
    max_num_solutions_p
end
