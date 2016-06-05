# An example of a document fragment that could be on any page
# <div id="error_explanation">
# In each page where we need to verify error messages
# we just require and include # this module
#

module ErrorPanel
    include PageObject


    div(:error_div, :id => 'error_explanation')

    # see page 96-97
    # finds a <ul> within the error div object
    unordered_list(:error_messages) do |page|
        page.error_div_element.unordered_list_element
    end
end
