require 'rspec'
require 'page-object'
require 'faker' # this gem can provide random data
require 'data_magic'
require 'require_all'

require_rel 'pages' # require_all method includes all files in dir

World(PageObject::PageFactory)

# these routes will help cut down the nav repetition in our steps
# page 109
PageObject::PageFactory.routes = {

    # this is one route. you can have many
    # providing args to a page: [HomePage, :select_puppy, 'Brook'],
    :default => [
        [HomePage, :select_puppy],
        [DetailsPage, :add_to_cart],
        [ShoppingCartPage, :proceed_to_checkout],
        [CheckoutPage, :checkout]
    ]
}
