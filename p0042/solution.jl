function readwords()
    raw_data = readline()
    raw_words = split(raw_data, ',')
    words = map(x -> strip(x, '"'), raw_words)
    words
end

function letterscore(letter::Char)::Int
    raw_letter_score::Int = letter
    raw_letter_score - 64
end

function wordscore(word)::Int
    sum(x -> letterscore(x), word)
end

function solve()
    triangle_numbers = Set(n * (n + 1) / 2 for n in 1:10_000)
    triangle_words_count = 0
    words = readwords()
    for word in words
        word_score = wordscore(word)
        if word_score in triangle_numbers
            triangle_words_count += 1
        end
    end
    triangle_words_count
end

println(solve())
