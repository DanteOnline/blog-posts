=begin
Revrite examples below using ternary operator
----------
if friends_are_also_coming?
    go_party
else
    stay_home
end
----------
if friends_are_also_coming? && !is_it_raining
    go_party
else
    stay_home
end
=end

# friends_are_also_coming? ? go_party : stay_home
# friends_are_also_coming? && !is_it_raining ? go_party : stay_home