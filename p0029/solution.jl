function solve(n=100)
    number_set = Set()
    for a in 2:n
        for b in 2:n
            push!(number_set, big(a)^b)
        end
    end
    length(number_set)
end
