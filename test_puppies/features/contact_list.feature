Feature: using xml in my cukes
    Scenario: find a phone number from a collection
        Given I have a phone book
            | name   | phone    |
            | Cheezy | 525-5305 |
            | Sneezy | 123-4567 |
            | Wheezy | 908-9999 |
        When I look up the phone number for "Sneezy"
        Then I should see the phone number "123-4567"
