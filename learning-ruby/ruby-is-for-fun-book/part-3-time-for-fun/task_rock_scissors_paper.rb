=begin
Write a game rock, scissors, paper
user pick one then computer puck one
=end

stuff = [:rock, :scissors, :paper]

loop do
    print 'rock, scissors or paper:'
    chosen_stuff = gets.chomp.to_sym

    if stuff.include?(chosen_stuff)
        puts "#{chosen_stuff} was chosen"
        computer_choise = stuff.sample
        puts "Computer chose #{computer_choise}"

        if chosen_stuff == computer_choise
            puts 'Equal'
        else
            is_you_win = chosen_stuff == :rock && computer_choise == :scissors || 
            chosen_stuff == :scissors && computer_choise == :paper ||
            chosen_stuff == :paper && computer_choise == :rock
            puts is_you_win ? 'You Win!' : 'Computer Win!'
        end
    else
        puts 'You should input only rock, scissors or paper'
        puts 'Try again'
    end
end