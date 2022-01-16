using DataStructures

function read_ciphertext()
    ciphertext = nothing
    open("p0059/input.txt", "r") do io
        ciphertext = map(x -> parse(Int, x), split(readline(io), ','))
    end
    ciphertext
end

function general_letter_frequencies()
    Dict(
        'a' => 0.082,
        'b' => 0.015,
        'c' => 0.028,
        'd' => 0.043,
        'e' => 0.13,
        'f' => 0.022,
        'g' => 0.02,
        'h' => 0.061,
        'i' => 0.07,
        'j' => 0.0015,
        'k' => 0.0077,
        'l' => 0.040,
        'm' => 0.024,
        'n' => 0.067,
        'o' => 0.075,
        'p' => 0.019,
        'q' => 0.00095,
        'r' => 0.060,
        's' => 0.063,
        't' => 0.091,
        'u' => 0.028,
        'v' => 0.0098,
        'w' => 0.024,
        'x' => 0.0015,
        'y' => 0.020,
        'z' => 0.00074,
    )
end

function encode(plaintext)
    map(x -> Int(x), collect(plaintext))
end

function decode(plaintext)
    join(map(x -> Char(x), plaintext))
end

function frequence_penalty(text)
    text_letter_counts = counter(map(x -> lowercase(x), text))
    diffs = Dict()
    for (letter, freq) in general_letter_frequencies()
        diffs[letter] = abs(text_letter_counts[letter] / length(text) - freq)
    end
    sum(values(diffs))
end

function decrypt(ciphertext, key1, key2, key3)
    plaintext = []
    for i in 1:lastindex(ciphertext)
        if i % 3 == 1
            key = key1
        elseif i % 3 == 2
            key = key2
        else
            key = key3
        end
        push!(plaintext, xor(ciphertext[i], key))
    end
    plaintext
end

function solve(debug=false)
    ciphertext = read_ciphertext()
    charset = Int('a'):Int('z')
    min_penalty = Inf
    min_penalty_plaintext = nothing
    for key1 in charset
        for key2 in charset
            for key3 in charset
                encoded_plaintext = decrypt(ciphertext, key1, key2, key3)
                plaintext = decode(encoded_plaintext)
                penalty = frequence_penalty(plaintext)
                if penalty < min_penalty
                    min_penalty = penalty
                    min_penalty_plaintext = plaintext
                end
            end
        end
    end
    if debug
        println(min_penalty_plaintext)
    end
    sum(encode(min_penalty_plaintext))
end
