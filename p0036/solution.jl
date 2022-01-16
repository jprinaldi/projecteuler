function ispal(n)
    digits(n) == reverse(digits(n))
end

function isdoublepal(n)
    ispal(n) && digits(n, base=2) == reverse(digits(n, base=2))
end

function solve()
    total_sum = 0
    for n in 1:999_999
        if isdoublepal(n)
            println(n)
            total_sum += n
        end
    end
    total_sum
end
