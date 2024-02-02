=begin
    Use hashmap from "weight on moon task"
    User choose the ball and add it to the basket. And he input balls count before.
    After he is done the program show total basket weigth (on moon and on the Earth)
=end

weigths = {
    soccer_ball: 410,
    tennis_ball: 58,
    golf_ball: 45
}

moon_weigths = {}
moon_weigths[:soccer_ball] = weigths[:soccer_ball]/6
moon_weigths[:tennis_ball] = weigths[:tennis_ball]/6
moon_weigths[:golf_ball] = weigths[:golf_ball]/6

basket = {}
total_weight_earth = 0
total_weigth_moon = 0

loop do
    print 'What ball do you want to buy (soccer_ball, tennis_ball, golf_ball):'
    ball = gets.chomp.to_sym
    if weigths.include?(ball)
        print 'How many balls do you want?:'
        count = gets.chomp.to_i
        if basket.include?(ball)
            basket[ball] += count
        else
            basket[ball] = count
        end
        total_weight_earth += count * weigths[ball]
        total_weigth_moon += count * moon_weigths[ball]
        puts basket.inspect
        puts 'Confirm the order: y/n'
        confirm = gets.chomp
        if confirm == 'y'
            puts "Basket weight on Earth #{total_weight_earth}"
            puts "Basket weight on Moon #{total_weigth_moon}"
            exit
        end
    else
        puts "We haven't got this type of balls"
        puts 'Try again'
    end

end