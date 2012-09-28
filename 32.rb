def findfactors(start, final)
  while start < final/start
    (start..final/start).each do | i | 
      start = i+1
      if final%i == 0      
        yield i, final/i
        break
      end
    end
  end
end

@products = []

(4140..9876).each do |d|
  # don't find factors unless it doesn't contain 0 or duplicate numbers
  next if d.to_s.match("0") || d.to_s.chars.to_a.uniq.join.length != d.to_s.length
  findfactors(1, d) do |x, y|
    ts = x.to_s + y.to_s + d.to_s
    tsl = ts.length
    next if ts.match("0")
    next unless tsl == 9 && tsl == ts.chars.to_a.uniq.join.length
    @products << d
    break
  end
end

puts @products.inject(0) {|sum, d| sum + d}

