using Dates

function solve()
    sunday_count = 0
    start_date = Date(1901, 1, 1)
    end_date = Date(2000, 12, 31)
    current_date = start_date
    while current_date != end_date
        if Dates.dayofmonth(current_date) == 1 && Dates.dayofweek(current_date) == Dates.Sunday
            sunday_count += 1
        end
        current_date += + Dates.Day(1)
    end
    sunday_count
end
