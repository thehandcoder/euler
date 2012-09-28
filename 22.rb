# I'm glad I built this caching mechanism.  It was slower than actually doing all the calculations.  Sometimes brute force is plenty of "fancy stuff"

class StringValue
  
  def initialize
    @tokenCache = {
      "A" => 1,
      "B" => 2,
      "C" => 3,
      "D" => 4,
      "E" => 5,
      "F" => 6,
      "G" => 7,
      "H" => 8,
      "I" => 9,
      "J" => 10,
      "K" => 11,
      "L" => 12,
      "M" => 13,
      "N" => 14,
      "O" => 15,
      "P" => 16,
      "Q" => 17,
      "R" => 18,
      "S" => 19,
      "T" => 20,
      "U" => 21,
      "V" => 22,
      "W" => 23,
      "X" => 24,
      "Y" => 25,
      "Z" => 26,
    }
  end
  
  def get_value(aString)
    tokens = get_token_values aString
    cache_missing_tokens aString unless tokens[:exist]
    tally_tokens tokens
  end
  
  def tally_tokens(tokens)
    tokens.delete(:exist)
    tokens.values.inject(0) { |sum, cv| sum + cv}
  end
  
  def get_token_values(aString)
    tokens = {}
    stringChars = aString.chars.to_a.reverse
    stringChars.each_with_index do | v, i |    
      tokens[v] = tokens[v] ? tokens[v] + @tokenCache[v] : @tokenCache[v]
      if i+1 < stringChars.length - 1
        possibleToken = stringChars[i+1..stringChars.length].reverse.join
        if @tokenCache[possibleToken]
          tokens[possibleToken] = @tokenCache[possibleToken]
          tokens[:exist] = true
          break
        end
      end
    end
    tokens
  end
  
  def cache_missing_tokens(aString)
    #Create tokens from string
    (1..aString.length-2).each do | x |
      token = aString[0..x]
      @tokenCache[token] = get_value(token) unless @tokenCache[token]
    end
  end
end

sv = StringValue.new

names = File.open("extra/names.txt").read
names = names.split(",").sort().map {|x| x.delete '"'}

@sum = 0
names.each_with_index do | n, i |
  @sum += sv.get_value(n) * (i + 1)
end

puts @sum