

# very basic steps in page objects but notice there is repetition appearing
Given(/^I have a pending adoption for "([^"]*)"$/) do |name|
    navigate_to(CheckoutPage).checkout('name' => name)
    #on(HomePage).select_puppy
    #on(DetailsPage).add_to_cart
    #on(ShoppingCartPage).proceed_to_checkout
    #on(CheckoutPage).checkout('name' => name)
end

When(/^I process the adoption$/) do
    visit(LandingPage)
    on(LoginPage).login_to_system
    on(LandingPage).adoptions
    on(ProcessPuppyPage).process_first_puppy
end


# page 110
# an example of using the third method of routes
#When(navigate to a page but do something along the way
#     navigate_to(page).do_something
#     continue_navigation_to(page).complete

