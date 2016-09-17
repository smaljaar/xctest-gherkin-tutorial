Feature: Payments
  Making a payment from my own account

  @test
  Scenario: As a user I want to make a payment

    Given I am on the dashboard
    When I tap on button Transfer
      And I see the screen Transfer
        And I enter <amount> in the amount field
        And I enter <name> in the beneficiary field
        And I enter <account number> in the accountnumber field
        And I tap on button Next
      And I see the screen Summary
        And I tap on button Transfer
      And I see the screen Espresso Bank
    Then my test has passed

|amount|name|account number|
|1.10|test name|NL69 INGB 0123 4567 89|
