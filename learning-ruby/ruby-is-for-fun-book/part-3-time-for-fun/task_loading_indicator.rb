=begin
Using /, -, \, | simbols create loading indicator.
You should output this simbols one by one in the same place
=end

TIMES = 10
sleep_range = 0.005..0.5

TIMES.times do 
    print "\r/"
    sleep rand(sleep_range)
    print "\r-"
    sleep rand(sleep_range)
    print "\r\\"
    sleep rand(sleep_range)
    print "\r|"
    sleep rand(sleep_range)
end