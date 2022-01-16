using DataStructures

function areperms(n, m)
    counter(string(n)) == counter(string(m))
end

function solve(target_count=5)
    cubes = []
    for base in 1:10_000
        push!(cubes, base^3)
    end
    for i in 1:(lastindex(cubes) - 1)
        perms_count = 1
        for j in (i + 1):lastindex(cubes)
            if areperms(cubes[i], cubes[j])
                perms_count += 1
            end
        end
        if perms_count == target_count
            return cubes[i]
        end
    end
end
