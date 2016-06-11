#re-implement a few cucumber scenarios but this time in RSpec
# this removes the need for .feature files
# page 114
describe "When checking out during an adoption" do
    it "should require last name" do
        visit HomePage
        navigate_to(CheckoutPage).checkout('name' => '')
        expect(on(CheckoutPage)).to have_error_message "Name can't be blank"
    end
    it "should display thank you message when checkout is complete" do
        visit HomePage
        navigate_all
        expect(on(CheckoutPage).text).to include "Thank you for adopting a puppy"
    end
end
