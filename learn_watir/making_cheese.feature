Feature: Making Cheese
    As a cheese maker
    I want to make cheese
    So I can share my cheesiness

    Scenario: Usng the cheese machine
        Given I have no cheese
        When I press the make cheese button
        Then I should receive 1 piece of cheese
