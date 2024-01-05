=begin
You are creating web-site for barbershop. Output all kinds of hair cream.
Each hair cream have two parameters: shine and hold. Each of them can get values from 1 til 2
=end

1.upto(5) do |shine| 
    1.upto(5) do |hold|
        puts "SHINE #{shine} HOLD #{hold}"
    end
end
