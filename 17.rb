tokens = {
  1    => "one",
  2    => "two",
  3    => "three",
  4    => "four",
  5    => "five",
  6    => "six",
  7    => "seven",
  8    => "eight",
  9    => "nine",
  10   => "ten",
  11   => "eleven",
  12   => "twelve",
  13   => "thirteen",
  14   => "fourteen",
  15   => "fifteen",
  16   => "sixteen",
  17   => "seventeen",
  18   => "eighteen",
  19   => "nineteen",
  20   => "twenty",
  30   => "thirty",
  40   => "forty",
  50   => "fifty",
  60   => "sixty",
  70   => "seventy",
  80   => "eighty",
  90   => "ninety",
  100  => "hundred",
  1000 => "thousand"
}


results = (1..1000).inject(0) do | sumTotal, number |
  @string = ""
  if number/1000 >= 1 
    @string += "#{tokens[(number/1000).to_i]}#{tokens[1000]}"
    number %= 1000
  end
  
  if number/100 >= 1 
    @string += "#{tokens[(number/100).to_i]}#{tokens[100]}"
    number %= 100
    @string += "and" if number > 0
  end

  if number > 19
    if number/10 >= 1 
      @string += tokens[(number/10)*10]
      number %= 10
    end
    @string += tokens[number] if number > 0
    
  elsif number > 0
    @string += tokens[number]
  end
  
  sumTotal + @string.length
end

puts results