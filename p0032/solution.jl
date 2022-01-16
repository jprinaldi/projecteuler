function solve()
    total_sum = 0
    seen_products = Set()
    for multiplicand in 1:10^4
        for multiplier in 1:10^4
            product = multiplicand * multiplier
            multiplicand_digits = digits(multiplicand)
            multiplier_digits = digits(multiplier)
            product_digits = digits(product)
            if !(product in seen_products)
                if length(multiplicand_digits) + length(multiplier_digits) + length(product_digits) == 9
                    digit_set = Set(union(multiplicand_digits, multiplier_digits, product_digits))
                    delete!(digit_set, 0)
                    if length(digit_set) == 9
                        total_sum += product
                        push!(seen_products, product)
                    end
                end
            end
        end
    end
    total_sum
end
