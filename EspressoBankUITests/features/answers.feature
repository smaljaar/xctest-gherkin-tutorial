Feature: Payments

Scenario Outline: As a user I want to make a payment
Given I tap on button Transfer
And I enter <amount> in the Amount field
And I enter <name> in the Name field
And I enter <account number> in the IBAN field
And I tap on button Send Payment
And I tap on button Confirm Payment
Then I see the element <Transaction done>

|amount|name|account number|Transaction done|
|1.10|test name|NL69 INGB 0123 4567 89|test name, NL69 INGB 0123 4567 89, - € 1.1|
|2.0 |jelle    |385378327             |jelle                                     |

@tapTransferButton
Scenario: As a user I want to quickly do a payment to a person from the transaction list.
Given I tap on element transaction with value <Transaction info>
And I tap on the Send payment button on alert with title Transaction
And I enter <amount> in the Amount field
And I tap on button Send Payment
And I tap on button Confirm Payment
Then I see the element <Transaction done>

|amount|Transaction info|Transaction done|
|1.10|Capgemini, NL99QWEB0987654321, + € 350.0|Capgemini, NL99QWEB0987654321, - € 1.1|


Scenario: As a user I want to be able to navigate back to transactions if I do not want to confirm the payment.
Given I tap on element transaction with value <Transaction info>
And I tap on the Send payment button on alert with title Transaction
And I enter <amount> in the Amount field
And I tap on button Send Payment
And I tap on element navigation back button with value Transfer
And I tap on element navigation back button with value Transactions
Then I see the element <Transaction info>

|amount|Transaction info|
|1.10|Capgemini, NL99QWEB0987654321, + € 350.0|
