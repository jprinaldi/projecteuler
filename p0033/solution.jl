function solve()
    prod = 1
    for n in 10:99
        for d in (n + 1):99
            if n % 10 == 0 && d % 10 == 0
                continue
            end
            intersection = intersect(digits(n), digits(d))
            if length(intersection) > 0
                bad_digits_n = setdiff(digits(n), intersection)
                bad_digits_d = setdiff(digits(d), intersection)
                if length(bad_digits_n) == 0 || length(bad_digits_d) == 0
                    continue
                end
                bad_n = sum(10^(i - 1) * x for (i, x) in enumerate(bad_digits_n))
                bad_d = sum(10^(i - 1) * x for (i, x) in enumerate(bad_digits_d))
                if (bad_n // bad_d == n // d)
                    prod *= n // d
                end
            end
        end
    end
    denominator(prod)
end
