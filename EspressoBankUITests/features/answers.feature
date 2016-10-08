Feature: Payments
Making a payment from my own account

@test
Scenario: As a user I want to make a payment

Given I am on the Transaction screen
When I tap on button Transfer
And I enter <amount> in the Amount field
And I enter <name> in the Name field
And I enter <account number> in the IBAN field
And I tap on button Send Payment
And I tap on button Confirm Payment
Then my test has passed

|amount|name|account number|
|1.10|test name|NL69 INGB 0123 4567 89|



Scenario: As a user I want to quickly do a payment to a person from the transaction list.
Given I am on the Transaction screen
And I tap on element transaction with value <Transaction info>
And I tap on the Send payment button on alert with title Transaction
And I enter <amount> in the Amount field
And I tap on button Send Payment
And I tap on button Confirm Payment
And I see the element <Transaction done>
Then my test has passed

|amount|Transaction info|Transaction done|
|1.10|Capgemini, NL99QWEB0987654321, + € 350.0|Capgemini, NL99QWEB0987654321, - € 1.1|
