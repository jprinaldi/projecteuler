using Combinatorics

function score(game, dice_size, dice_count)
    sum(digits(game, base=dice_size)) + dice_count
end

function solve()
    peter_wins = 0
    peter_dice = (1, 2, 3, 4)
    peter_dice_count = 9
    num_peter_games = length(peter_dice)^peter_dice_count
    colin_dice = (1, 2, 3, 4, 5, 6)
    colin_dice_count = 6
    num_colin_games = length(colin_dice)^colin_dice_count
    num_different_games = num_peter_games * num_colin_games
    for peter_game in 0:(num_peter_games - 1)
        for colin_game in 0:(num_colin_games - 1)
            peter_score = score(peter_game, length(peter_dice), peter_dice_count)
            colin_score = score(colin_game, length(colin_dice), colin_dice_count)
            if peter_score > colin_score
                peter_wins += 1
            end
        end
    end
    return round(peter_wins / num_different_games, digits=7)
end
