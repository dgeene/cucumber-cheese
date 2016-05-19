# Another way of extending the World class in cucumber is through transformations
# Cucumber will automatically convert it for us
# Transformations are helpful when you have values that need to be converted and don't
# want repetitave code in your step definitions.


# This line says, is find a capture group of a step definition that contains "line item"
# plus a number and performa a specific action on the value of the number
# portion of the step definition surrounded by parentheses
Transform /^line item (\d+)$/ do |line_string|
    line_string.to_i
end
