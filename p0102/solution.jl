struct Point
    x::Int
    y::Int
end

struct Triangle
    a::Point
    b::Point
    c::Point
end

function area(t::Triangle)
    abs(t.a.x * (t.b.y - t.c.y) + t.b.x * (t.c.y - t.a.y) + t.c.x * (t.a.y - t.b.y)) / 2
end

function read_triangles()
    triangles::Array{Triangle} = []
    for line in eachline("p0102/input.txt")
        coords = map(x -> parse(Int, x), split(line, ','))
        a = Point(coords[1], coords[2])
        b = Point(coords[3], coords[4])
        c = Point(coords[5], coords[6])
        push!(triangles, Triangle(a, b, c))
    end
    triangles
end

function solve()
    triangles = read_triangles()
    origin = Point(0, 0)
    target_count = 0
    for t in triangles
        t1 = Triangle(origin, t.a, t.b)
        t2 = Triangle(origin, t.a, t.c)
        t3 = Triangle(origin, t.b, t.c)
        if area(t1) + area(t2) + area(t3) == area(t)
            target_count += 1
        end
    end
    target_count
end
