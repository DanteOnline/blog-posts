=begin
Class monkey contains two method: run, stop. Each methods should change object state.
User can read class state but can't modify it 
=end

class Monkey
    attr_reader :state

    def initialize
        @state = :stopped
    end

    def run
        @state = :running
    end

    def stop
        @state = :stopped
    end
end

monkey = Monkey.new
puts monkey.state
monkey.run
puts monkey.state