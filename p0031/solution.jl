using DataStructures

function solve_aux(amt, coins, memo)
    if amt < 0
        return 0
    end
    if amt == 0
        return 1
    end
    if length(coins) == 1
        return 1
    end
    if (amt, coins) in keys(memo)
        return memo[(amt, coins)]
    end
    memo[(amt, coins)] = solve_aux(amt - last(coins), coins, memo) + solve_aux(amt, coins[1:(end - 1)], memo)
    return memo[(amt, coins)]
end

function solve(n)
    coins = [1,2,5,10,20,50,100,200]
    memo = Dict()
    for amt in 1:n
        solve_aux(amt, coins, memo)
    end
    memo[(n, coins)]
end
