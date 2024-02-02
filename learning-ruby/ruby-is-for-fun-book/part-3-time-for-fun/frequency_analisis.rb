str = 'the quick brown fox jumps over the lazy dog'

arr = str.split(' ')

hh = {}

arr.each do |word|
    if hh[word].nil?
        hh[word] = 1
    else
        hh[word] += 1
    end
end

puts hh.inspect

hh = Hash.new(0)

arr.each do |word|
    hh[word] += 1
end

puts hh.inspect