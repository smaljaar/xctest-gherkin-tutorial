@test
Feature: make a payment
Scenario: as a user I want to transfer money
Given I start the app
When I make a transfer
Then I see a transaction
