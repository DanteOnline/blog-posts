=begin
We have this data:
data = {
    soccer_ball: { name: 'Soccer ball', weight: 410, qty: 5 },
    tennis_ball: { name: 'Tennis ball', weight: 58, qty: 10 },
    golf_ball: { name: 'Golf ball', weight: 45, qty: 15 }
}
The program should output:
Stored:
Soccer ball, weight 410 gramm, count: 5.
Tennis ball, weight 58 gramm, count: 10.
Golf ball, weight 45 gramm, count: 15.
=end

data = {
    soccer_ball: { name: 'Soccer ball', weight: 410, qty: 5 },
    tennis_ball: { name: 'Tennis ball', weight: 58, qty: 10 },
    golf_ball: { name: 'Golf ball', weight: 45, qty: 15 }
}

puts 'Stored:'

data.each_value do |v|
    puts "#{v[:name]}, weight #{v[:weight]} gramm, count: #{v[:qty]}."
end