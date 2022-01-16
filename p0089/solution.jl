using RomanNumerals

function read_roman_numbers()
    eachline("p0089/input.txt")
end

function solve()
    roman_numbers = read_roman_numbers()
    chars_saved = 0
    for roman_number in roman_numbers
        chars_saved += length(roman_number) - length(RomanNumeral(roman_number))
    end
    chars_saved
end
