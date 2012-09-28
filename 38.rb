@answers = []
(1..50000).each do |x|
  @stretch = ""
  while @stretch.length < 9
    count ||= 0
    count += 1
    @stretch << (x*count).to_s
  end
  next unless @stretch.size == 9
  next if @stretch.match("0")
  next unless  @stretch.size == @stretch.chars.to_a.uniq.join.length
  @answers << @stretch
end
puts @answers.max