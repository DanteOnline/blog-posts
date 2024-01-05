score = 0
yes = 'y'
puts 'Have you got hight school education? (y/n)'
answer = gets.chomp
score+=1 if answer == yes
puts 'Are you software engeneer? (y/n)'
answer = gets.chomp
if answer == yes
    score+=1 
    puts 'Have you got more then 3 years experience? (y/n)'
    answer = gets.chomp
    score+=1 if answer == yes
end

puts 'Welcome to the USA' if score >= 2