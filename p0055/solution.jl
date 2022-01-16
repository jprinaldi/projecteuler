function ispal(n)
    string(n) == reverse(string(n))
end

function islychrel(n)
    for i in 1:50
        n = n + parse(Int128, reverse(string(n)))
        if ispal(n)
            return false
        end
    end
    return true
end

function solve()
    lychrel_count = 0
    for n in 1:9_999
        if islychrel(n)
            lychrel_count += 1
        end
    end
    return lychrel_count
end
