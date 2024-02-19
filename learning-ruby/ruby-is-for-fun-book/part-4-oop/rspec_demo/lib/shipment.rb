module Shipment
    module_function
    
    def total_weight(options={})
        a = options[:soccer_ball_count] || 0
        b = options[:tennis_ball_count] || 0
        c = options[:golf_ball_count] || 0
        (a * 410) + (b * 58) + (c * 45) + 29
    end
end