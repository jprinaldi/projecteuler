using Combinatorics
using DataStructures

function isperfectsquare(x)
    isqrt(x)^2 == x
end

function wton(word, mapping)
    parse(Int, join(map(c -> mapping[c], collect(word))))
end

function solve()
    line = readline("p0098/input.txt")
    words = split(filter(c -> c != '"', line), ',')
    sort!(words, by=length, rev=true)
    word_dict = DefaultDict(Set)
    max_n = 0
    for word in words
        rep = join(sort(collect(word)))
        push!(word_dict[rep], word)
    end
    for anagrams in sort(collect(values(word_dict)), by=(x -> length(first(x))), rev=true)
        unique_chars = unique(first(anagrams))
        for comb in combinations(0:9, length(unique_chars))
            for perm in permutations(comb)
                mapping = Dict()
                for i in 1:length(unique_chars)
                    mapping[unique_chars[i]] = perm[i]
                end
                for i in 1:length(anagrams) - 1
                    for j in (i + 1):length(anagrams)
                        if mapping[first(collect(anagrams)[i])] == 0 || mapping[first(collect(anagrams)[j])] == 0
                            continue
                        end
                        n1 = wton(collect(anagrams)[i], mapping)
                        n2 = wton(collect(anagrams)[j], mapping)
                        if isperfectsquare(n1) && isperfectsquare(n2)
                            max_n = max(max_n, n1, n2)
                        end
                    end
                end
            end
        end
    end
    return max_n
end
# 80514729
