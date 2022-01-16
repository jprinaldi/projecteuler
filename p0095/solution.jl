function divisors(n)
    filter(k -> n % k == 0, 1:div(n, 2))
end

function chainnext(n)
    sum(divisors(n))
end

function solve(upper_bound=10^6)
    members = Dict(0 => Set{Int}())
    for start in 1:upper_bound
        (start % 10^4 == 0) && println(start)
        member_candidates = Set{Int}(start)
        current = chainnext(start)
        while current != start
            if current > upper_bound
                member_candidates = Set{Int}()
                break
            elseif haskey(members, current)
                if start ∈ members[current]
                    member_candidates = members[current]
                    break
                else
                    member_candidates = Set{Int}()
                    break
                end
            elseif current ∈ member_candidates
                member_candidates = Set{Int}()
                break
            else
                push!(member_candidates, current)
                current = chainnext(current)
            end
        end
        members[start] = member_candidates
    end
    member_values = Set(values(members))
    max_length = maximum(x -> length(x), member_values)
    filtered_member_values = Set(filter(x -> length(x) == max_length, member_values))
    return minimum(first(filtered_member_values))
end
