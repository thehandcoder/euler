sum = (1..1000000).inject(0) do |sum, x|
  if x.to_s == x.to_s.reverse && x.to_s(2) == x.to_s(2).reverse
    sum + x
  else
    sum
  end
end

puts sum