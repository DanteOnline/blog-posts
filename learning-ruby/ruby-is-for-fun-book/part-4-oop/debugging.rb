require 'pry'

def random_pow
    pow(rand(1..10))
end

def pow(x)
    binding.pry
    x ** 2
end

puts random_pow