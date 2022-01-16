function solve(upper_bound=1_000)
    max_recurring_cycle_length = 0
    answer = nothing
    for d in 1:(upper_bound - 1)
        a = big(1)
        done = false
        while !done
            for b in 1:(a - 1)
                if (10^b * (10^(a - b) - 1)) % d == 0
                    cycle_length = a - b
                    done = true
                    if cycle_length > max_recurring_cycle_length
                        max_recurring_cycle_length = cycle_length
                        answer = d
                    end
                end
            end
            a += 1
        end
    end
    answer
end
