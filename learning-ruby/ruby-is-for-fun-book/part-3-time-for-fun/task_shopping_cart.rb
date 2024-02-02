=begin
User shopping cart is array 
cart = [
{ type: :soccer_ball, qty: 2 },
{ type: :tennis_ball, qty: 3 }
]
qty - count stuff which user want to buy
type - product type
The inventory is array
inventory = {
soccer_ball: { available: 2, price_per_item: 100 },
tennis_ball: { available: 1, price_per_item: 30 },
golf_ball: { available: 5, price_per_item: 5 }
}
Write a program to show total price (cost of all products) and show is it possible to succed user request 
=end

cart = [
    { type: :soccer_ball, qty: 2 },
    { type: :tennis_ball, qty: 3 }
]

inventory = {
    soccer_ball: { available: 2, price_per_item: 100 },
    tennis_ball: { available: 1, price_per_item: 30 },
    golf_ball: { available: 5, price_per_item: 5 }
}

total_cost = 0
availability = true

# Cart total cost
cart.each do |product|
    product_type = product[:type]
    inventory_item = inventory[product_type]
    product_cost = inventory_item[:price_per_item]
    product_cout = product[:qty]
    product_total_cost = product_cost * product_cout
    total_cost += product_total_cost
    if inventory_item[:available] < product[:qty]
        availability = false
    end
end

puts "Total cost #{total_cost}"
puts availability ? 'You can do this order' : "You can't do this order"

# availability


