
# page 102
# another example of a document fragment
# that is used on multiple pages
module SideMenuPanel
    include PageObject

    link(:adopt_puppy , :text => "Adopt a puppy")
    link(:learn , :text => "Learn")
    link(:animal_shelters , :text => "Animal Shelters")
    link(:classifieds , :text => "Classifieds")
    link(:message_boards , :text => "Message Boards")
    link(:pet_news , :text => "Pets News")
end
