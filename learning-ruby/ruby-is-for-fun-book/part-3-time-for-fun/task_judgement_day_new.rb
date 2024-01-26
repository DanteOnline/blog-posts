=begin
Add birthdays. New humans and machines appears
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

def check_victory?
    @humans <= 0 or @machines <= 0
end



loop do
    if check_victory?
        exit
    end

    dice = rand(1..3)

    case dice
    when 1
        event1
    when 2
        event2
    when 3
        event3
    end

    stats

    random_sleep

    birth

    stats

    random_sleep
end