function solve()
    total_sum = 1
    last_number = 1
    increment = 2
    while last_number < 1002001
        for _ in 1:4
            last_number += increment
            total_sum += last_number
        end
        increment += 2
    end
    total_sum
end
