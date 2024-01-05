=begin
output numbers from 50 till 100.
if the number is even output even else output odd
=end

50.upto(100) do |i|
    even_odd = 'odd'
    if i.even?
        even_odd = 'even'
    end
    puts "#{i} #{even_odd}"
end