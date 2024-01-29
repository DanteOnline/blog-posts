=begin
There is two team with robots.
In the turn one team attack another. This team attack robot with random index.
If robot with this index alive it became destroied, but if it is already destroied nothing happend.
When all robots in the team was destroied - team lost
=end


@arr1 = Array.new(10,1)
@arr2 = Array.new(10,1)


def attack(robot_index, robot_list)
    robot_list[robot_index] = 0
end

def get_random_robot_index
    rand(0..9)
end

def show_stats_team(robot_list)
    print robot_list
    puts
    alive_robots = robot_list.count { |val| val==1 }
    
    print "#{alive_robots} Robots alive"
    puts
    if alive_robots == 0
        puts 'Team lost'
        exit
    end
end

def show_all_stats
    show_stats_team(@arr1)
    show_stats_team(@arr2)
end

while loop do
    puts 'First team attack'
    index = get_random_robot_index
    puts "Robot #{index} has been attacked"
    attack(index, @arr2)
    show_all_stats
    puts 'Second team attack'
    index = get_random_robot_index
    puts "Robot #{index} has been attacked"
    attack(index, @arr1)
    show_all_stats
    # puts "Next turn (<Enter>)"
    # gets
end
