=begin
Write a method "launch" which will be get hash with parameters:
- angle - angle rocket launch - default 90
- astronauts - array :belka, :strelka default - both
- delay - seconds befoure start rocket launch - default 5
Method should show seconds before start then show who was launched to the space and the angle
=end

def launch(options={})
    angle = options[:angle] || 90
    astronauts = options[:astronauts] || [:belka, :strelka]
    delay = options[:delay] || 5
    delay.downto(1) do |i|
        sleep(1)
        puts i
    end
    puts "astronauts #{astronauts} was launched with #{angle} angle"
end

launch
launch(angle: 90)
launch(delay: 3)
launch(delay: 3, angle: 91)
launch(delay: 1, astronauts: [:belka])