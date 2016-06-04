Feature: Adopting puppies
    As a puppy lover
    I want to adopt puppies
    so they can chew my furniture

    Background:
        Given I am on the puppy adoption site.

    Scenario Outline: Adopting one puppy
        When I click the View Details button for "Brook"
        And I click the Adopt Me button
        And I click the Complete the Adoption button
        And I enter "<name>" in the name field
        And I enter "<address>" in the address field
        And I enter "<email>" in the email field
        And I select "<pay_type>" from the pay with dropdown
        And I click the Place Order button
        Then I should see "Thank you for adopting a puppy!"
    Examples:
            | name | address | email | pay_type |
            |Cheezy | 123 Main st. | cheezy@example.com | Credit card |
            |Joseph | 555 South st. | joe@guru.org | Check |

    # This is an example of a scenerios with too much HOW (implementation details) in
    # order to test the WHAT (behavior)
    # We should not have to jump trhough many pages. None of the data entered on the form has
    # any impact on the outcome of this scnario
    Scenario: Adopting two puppies
        When I click the View Details button for "Brook"
        And I click the Adopt Me button
        And I click the Adopt Another Puppy button
        When I click the View Details button for "Hanna"
        And I click the Adopt Me button
        And I click the Complete the Adoption button
        And I enter "Cheezy" in the name field
        And I enter "123 Main Street" in the address field
        And I enter "cheezy@example.com" in the email field
        And I select "Credit card" from the pay with dropdown
        And I click the Place Order button
        Then I should see "Thank you for adopting a puppy!"


    # more simple scenario. Notice it is similar to the one above
    Scenario: Thank you message should be displayed
        When I complete the adoption of a puppy
        Then I should see "Thank you for adopting a puppy!"

    # an example of using a table to provide data for the test
    Scenario: Adopting a puppy using a table
        When I click the View Details button for "Brook"
        And I click the Adopt Me button
        And I click the Complete the Adoption button
        And I complete the adoption with:
        | name   | address         | email              | pay_type |
        | Cheezy | 123 Main Street | cheezy@example.com | Check    |
        Then I should see "Thank you for adopting a puppy!"

    Scenario: Validate cart with one puppy
        When I click the View Details button for "Brook"
        And I click the Adopt Me button
        Then I should see "Brook" as the name for line item 1
        And I should see "$34.95" as the subtotal for line item 1
        And I should see "$34.95" as the cart total

    Scenario: Validate cart with two puppies
        When I click the View Details button for "Brook"
        And I click the Adopt Me button
        And I click the Adopt Another Puppy button
        When I click the View Details button for "Hanna"
        And I click the Adopt Me button
        Then I should see "Brook" as the name for line item 1
        And I should see "$34.95" as the subtotal for line item 1
        And I should see "Hanna" as the name for line item 2
        And I should see "$22.99" as the subtotal for line item 2
        And I should see "$57.94" as the cart total

