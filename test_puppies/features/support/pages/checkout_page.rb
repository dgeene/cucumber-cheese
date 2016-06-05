class CheckoutPage
    include PageObject
    include DataMagic

    #Data magic can take car of default data
    #DEFAULT_DATA = {
    #    'name' => Faker::Name.name,
    #    'address' => Faker::Address.street_address
    #    'email' => Faker::Internet.email
    #    'pay_type' => 'Credit card'
    #}

    text_field(:name, :id => "order_name")
    text_field(:address, :id => 'order_address')
    text_field(:email, :id => 'order_email')
    select_list(:pay_type, :id => 'order_pay_type')
    button(:place_order, :value => 'Place Order')
    div(:error_div, :id => 'error_explanation')

    # see page 96-97
    # finds a <ul> within the error div object
    unordered_list(:error_messages) do |page|
        page.error_div_element.unordered_list_element
    end

    def checkout(data = {})
        #self.name = data['name']
        #self.address = data['address']
        #self.email = data['email']
        #self.pay_type = data['pay_type']
        #data = DEFAULT_DATA.merge(data)
        #populate_page_with  DEFAULT_DATA.merge(data)
        populate_page_with  data_for(:checkout_page, data)
        place_order
    end

end
