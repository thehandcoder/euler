p = File.open("extra/triangle.txt").read
p = p.split("\n").map! {|x| x.split().map! {|y| y.to_i}}

#get a path
#path is position or position -1
#pick the largest possible option

class Point
  attr_accessor :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end
end

c = Point.new(0, 1)

while c.y < p.length do  
  if c.x == 0
    p[c.y][c.x] += p[c.y - 1][c.x]
  elsif c.x == c.y
    p[c.y][c.x] += p[c.y - 1][c.x - 1]
  else
    p[c.y][c.x] += [p[c.y - 1][c.x - 1], p[c.y - 1][c.x]].max
  end
  
  c.x += 1
  if c.x >= p[c.y].length
    c.y += 1
    c.x = 0 
  end
end

puts p.last.max