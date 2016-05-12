Given(/^I have no cheese$/) do
    puts "I am sad. I have no cheese"
end

When(/^I press the make cheese button$/) do
    puts "there is hope. This machine works"
end

Then(/^I should receive (\d+) piece of cheese$/) do |num_pieces|
    puts "Rejoice! we have #{num_pieces} pieces of cheese"
end
