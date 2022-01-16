function next_in_chain(n)
    sum(map(d -> factorial(d), digits(n)))
end

function count_terms(n)
end

function solve(upper_bound=1_000_000, target_term_count=60)
    target_chain_count = 0
    for n in 1:(upper_bound - 1)
        term_count = 0
        seen_terms = Set()
        while !(n in seen_terms)
            push!(seen_terms, n)
            n = next_in_chain(n)
            term_count += 1
        end
        if term_count == target_term_count
            target_chain_count += 1
        end
    end
    target_chain_count
end
