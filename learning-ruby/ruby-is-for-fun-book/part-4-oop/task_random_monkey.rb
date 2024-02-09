=begin
Modify task_monkey.rb
Use random state in initialie.
Create 10 monkeys and check its state
=end

class Monkey
    attr_reader :state

    def initialize
        states = [:stopped, :running]
        @state = states.sample
    end

    def run
        @state = :running
    end

    def stop
        @state = :stopped
    end
end

10.times do 
    monkey = Monkey.new
    puts monkey.state
end