@i = 0
sn = 1001

(3..sn).step(2).each do | base |
  ((base-2)**2 + (base - 1)..(base**2)).step(base - 1).each {| point | @i += point}
end

puts @i + 1