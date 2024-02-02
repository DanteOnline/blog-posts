=begin
We have hashtable with weight
obj = {
soccer_ball: 410,
tennis_ball: 58,
golf_ball: 45
}
We need to adopt weight to the moon. We know that on the moon weight lesser in 6 times
=end

weigths = {
    soccer_ball: 410,
    tennis_ball: 58,
    golf_ball: 45
}

weigths[:soccer_ball] = weigths[:soccer_ball]/6
weigths[:tennis_ball] = weigths[:tennis_ball]/6
weigths[:golf_ball] = weigths[:golf_ball]/6

puts weigths.inspect

