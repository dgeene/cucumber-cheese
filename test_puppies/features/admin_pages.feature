# more administrative features of the site
# page 105
# notice how there is much less implementation details than in the beginning of the book scenarios

Feature: Adopting puppies
    As a puppy lover
    I want to adopt puppies
    so they can chew my furniture

    Background:
        Given I am on the puppy adoption site.


   #Scenario: Verify message when adoption is processed
   #     When I process a pending adoption
   #     Then I should see a thank you message
        # Message is "please thank <adopter's name> for the order!

    Scenario: Verify message when adoption is processed
        Given I have a pending adoption for "Tom Jones"
        When I process the adoption
        Then I should see "Please thank Tom Jones for the order!"
