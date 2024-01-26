print 'Please input your age'
age = gets.to_i
if age < 18
    puts 'Sorry but you are too young'
    exit
end

balance = 20
loop do
    #
    puts 'Push <Enter> to use the arm...'
    gets
    x = rand(0..5)
    y = rand(0..5)
    z = rand(0..5)

    puts "Result #{x} #{y} #{z}"

    if x == 0 and y == 0 and z == 0
        balance = 0
        puts 'Your balase is 0'
    elsif x == 1 and y == 1 and z == 1
        balance += 10
        puts 'Your balanse increase on 10$'
    elsif x == 2 and y == 2 and z == 2
        balance += 20
        puts 'Your balanse increase on 20$'
    else
        balance -= 0.5
        puts 'Your balanse decrease on 50 cents'
    end

    puts "Your balance #{balance}"

end