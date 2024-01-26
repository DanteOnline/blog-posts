=begin
Add three new events
=end

@humans = 10
@machines = 10

def luck?
    rand(0..1) == 1
end

def boom
    diff = rand(1..5)
    if luck?
        @machines -= diff
        puts "#{diff} machines destroyed"
    else
        @humans -= diff
        puts "#{diff} humans died"
    end
end

def birth
    diff = rand(1..5)
    if luck?
        @machines += diff
        puts "#{diff} machines appear"
    else
        @humans += diff
        puts "#{diff} humans appear"
    end
end

def random_city
    dice = rand(1..5)
    case dice
    when 1
        'Moscow'
    when 2
        'Los Angeles'
    when 3
        'Beijing'
    when 4
        'London'
    else
        'Seul'
    end
end

def random_sleep
    sleep rand(0.3..1.5)
end

def stats
    puts "#{@humans} humans and #{@machines} machines left"
end


def event1
    puts "The rocket has been launched to the #{random_city}"
    random_sleep
    boom
end

def event2
    puts "Radioactive weapon has been used in the #{random_city}"
    random_sleep
    boom
end

def event3
    puts "Group of soulders break the town defence in #{random_city}"
    random_sleep
    boom
end

def event4
    puts "Random human and machine soldiers meet each other in #{random_city}"
    random_sleep
    boom
end

def event5
    puts "Diversion in #{random_city}"
    random_sleep
    boom
end

def event6
    puts "Technological disaster in #{random_city}"
    random_sleep
    boom
end

def check_victory?
    @humans <= 0 or @machines <= 0
end



loop do
    if check_victory?
        exit
    end

    dice = rand(1..6)

    case dice
    when 1
        event1
    when 2
        event2
    when 3
        event3
    when 4
        event4
    when 5
        event5
    when 6
        event6
    end

    stats

    random_sleep

    birth

    stats

    random_sleep
end