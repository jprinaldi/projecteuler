struct BaseExp
    base::BigInt
    exponent::BigInt
end

function read_pairs()
    pairs = []
    for line in eachline("p0099/input.txt")
        base, exponent = map(x -> parse(BigInt, x), split(line, ','))
        pair = BaseExp(base, exponent)
        push!(pairs, pair)
    end
    pairs
end

function solve()
    pairs = read_pairs()
    argmax(map(x -> x.exponent * log(x.base), pairs))
end
