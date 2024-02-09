class Robot
    attr_accessor :x, :y

    def initialize
        @x = 0
        @y = 0
    end

    def right
        self.x += 1
    end

    def left
        self.y += 1
    end

    def up
        self.y += 1
    end

    def down
        self.y -= 1
    end
end

robot = Robot.new

robot.up
robot.up
robot.up
robot.right

puts "x = #{robot.x}, y = #{robot.y}"

robots = Array.new(10) { Robot.new }

actions = [:right, :left, :up, :down]

robots.each do |robot|
    m = actions.sample
    robot.send(m)
end

