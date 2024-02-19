=begin
Change "Show robots"
Add robot number to initialize method.
If robot number is even methods up and down should do nothing
If robot number is odd methods left and right should do nothing 
=end

class Robot

    attr_accessor :x, :y, :number

    def initialize(options={})
        @x = options[:x] || 0
        @y = options[:y] || 0
        @number = options[:number] || rand(1..666)
        @nuber_is_even = @number.even?
        @nuber_is_odd = !@nuber_is_even
    end

    def right
        if @nuber_is_even
            self.x += 1
        end
    end

    def left
        if @nuber_is_even
            self.x -= 1
        end
    end

    def up 
        if @nuber_is_odd
            self.y += 1
        end
    end

    def down
        if @nuber_is_odd
            self.y -= 1
        end
    end

end

class Commander

    def move(who)
        m = [:right,:left,:up,:down].sample
        who.send(m)
    end
end

commander = Commander.new

arr = Array.new(10) { Robot.new }

loop do
    # clear screen
    puts "\e[H\e[2J"

    (12).downto(-12) do |y|
        (-30).upto(30) do |x|
            found = arr.any? { |robot| robot.x == x and robot.y == y }

            if found 
                print '*'
            else
                print '.'
            end
        end
        puts
    end

    arr.each do |robot|
        commander.move(robot)
    end

    sleep 0.5
    
end

