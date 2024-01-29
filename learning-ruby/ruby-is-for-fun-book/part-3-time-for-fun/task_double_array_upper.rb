=begin
Create 2xD array with 3x3 size. Each element will be the same value (for example "Something")
Get this array and translate all elements in uppercase
=end

arr = Array.new(3, Array.new(3, 'Something'))

puts arr

0.upto(arr.size-1) do |i|
    0.upto(arr.size-1) do |j|
        arr[i][j].upcase!
    end
end

puts arr