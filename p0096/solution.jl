using Sudoku

function read_puzzles()
    num_puzzles = 50
    puzzles = []
    open("p0096/input.txt", "r") do io
        for _ in 1:num_puzzles
            puzzle = []
            readline(io)
            for _ in 1:9
                row = [x for x in map(x -> parse(Int, x), collect(readline(io)))]
                push!(puzzle, row)
            end
            push!(puzzles, collect(transpose(reduce(hcat, puzzle))))
        end
        puzzles
    end
end

function solve()
    puzzles = read_puzzles()
    answer = 0
    for puzzle in puzzles
        solved_puzzle = sudoku(puzzle)
        answer += sum(x * 10^(i - 1) for (i, x) in enumerate(reverse(solved_puzzle[1, 1:3])))
    end
    answer
end
