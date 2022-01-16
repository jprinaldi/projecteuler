require 'humanize'

def solve(n)
    strings = []
    for i in 1..n
        strings.push(i.humanize.split(/[\-\s]/).join)
    end
    strings.join
end

puts solve(1000).size
