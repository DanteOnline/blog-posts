=begin
Frequency analisis for letters in the text
=end

str = 'the quick brown fox jumps over the lazy dog'

hh = {}

hh = Hash.new(0)

str.chars.each do |letter|
    hh[letter] += 1
end

puts hh.inspect