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
