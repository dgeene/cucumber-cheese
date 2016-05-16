# This class has knowlege of the shopping cart
class ShoppingCartPage
    include PageObject

    NAME_COLUMN = 1
    SUBTOTAL_COLUMN = 3
    LINES_PER_PUPPY = 6

    button(:proceed_to_checkout, :value => 'Complete the Adoption')
    button(:continue_chopping, :value => 'Adopt Another Puppy')
    table(:cart, :index => 0)
    cell(:cart_total, :class => 'total_cell')

    def name_for_line_item(line_item)
        table_value(line_item, NAME_COLUMN)
    end

    def subtotal_for_line_item(line_item)
        table_value(line_item, SUBTOTAL_COLUMN)
    end


    private

    # calculate table row
    def table_value(line_item, column)
        row = (line_item.to_i - 1) * LINES_PER_PUPPY
        cart_element[row][column].text
    end

end
