Given(/^I am on the puppy adoption site\.$/) do
    # start using factory methods so we don't have to repeatedly use variables
    # instead use
    # on(HomePAge)
    # visit(HomePage)
    # @current_page
    #@browser.goto 'http://puppies.herokuapp.com'
    #@home = HomePage.new(@browser)
    visit(HomePage)
end


When(/^I click the View Details button for "([^"]*)"$/) do |name|
    on(HomePage).select_puppy name
end

When(/^I click the Adopt Me button$/) do
    on(DetailsPage).add_to_cart
end

When(/^I click the Complete the Adoption button$/) do
    on(ShoppingCartPage).proceed_to_checkout
end

When(/^I click the Adopt Another Puppy button$/) do
    on(ShoppingCartPage).continue_shopping
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
    on(CheckoutPage).name = name
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
    on(CheckoutPage).address = address
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
    on(CheckoutPage).email = email
end

When(/^I select "([^"]*)" from the pay with dropdown$/) do |pay_type|
    on(CheckoutPage).pay_type = pay_type
end

When(/^I click the Place Order button$/) do
    on(CheckoutPage).place_order
end


When(/^I complete the adoption with:$/) do |table|
    # table is a Cucumber::Core::Ast::DataTable
    on(CheckoutPage).checkout(table.hashes.first)
end

# this will search for text anywhere on the page
Then(/^I should see "([^"]*)"$/) do |expected|
    expect(@current_page.text).to include expected
end


# matches text within the <div id="error_explanation"> on checkout page
Then(/^I should see the error message "([^"]*)"$/) do |msg|
    #expect(on(CheckoutPage).error_messages).to include msg #
    #expect(@current_page.error_messages).to include msg
    # an example of using a custom matcher
    expect(@current_page).to have_error_message msg # is expect part of RSpec?
end

# an example of using default data
When /^I complete the adoption of a puppy$/ do
    navigate_all #page 109 replaces all these repetitave steps
    #on(HomePage).select_puppy
    #on(DetailsPage).add_to_cart
    #on(ShoppingCartPage).proceed_to_checkout
    #on(CheckoutPage).checkout
end

# the name field is a reuqired field
When /^I checkout leaving the name field blank/ do
    navigate_to(CheckoutPage).checkout('name' => '')
    #on(HomePage).select_puppy
    #on(DetailsPage).add_to_cart
    #on(ShoppingCartPage).proceed_to_checkout
    #on(CheckoutPage).checkout('name' => '') # override default
end

When /^I complete the adoption using a Credit card$/ do
    on(CheckoutPage).checkout('pay_type' => 'Credit card')
end
When /^I complete the adoption$/ do
    on(CheckoutPage).checkout
end

##### table stuff
Then(/^I should see "([^"]*)" as the name for (line item \d+)$/) do |name, line_item|
    expect(on(ShoppingCartPage).name_for_line_item(line_item)).to include name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
    expect(on(ShoppingCartPage).subtotal_for_line_item(line_item.to_i)).to eql subtotal
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
    expect(on(ShoppingCartPage).cart_total).to eql total
end
