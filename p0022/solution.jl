function read()
    [strip(x, '"') for x in split(readline(), ',')]
end

function letter_score(letter)::Int
    raw_letter_score::Int = letter
    raw_letter_score - 64
end

function get_name_score(name, index)
    sum(x -> letter_score(x), name) * index
end

function solve()
    names = read()
    sort!(names)
    total_score = 0
    for (index, name) in enumerate(names)
        name_score = get_name_score(name, index)
        total_score += name_score
    end
    total_score
end

println(solve())
