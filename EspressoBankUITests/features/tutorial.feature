# (1) Write a gherkin feature that tests doing a complete payment by only
# tapping on user interface elements
# and by entering test data (typing text)
# You only need to write Gherkin to complete this assignment.
# The beginning is there. Just add some steps
# Good luck!

# Extra Instructions:
# -------------------
# Steps you need to finish this assignment, prefixed each with either Given, When, Then or And:
# I tap on button (.*)
# I enter (.*) in the (.*) field

Feature: Payments
Scenario: As a user I want to make a payment

#Given ......
#When .....
#And .....
#Then .....
Given I tap on button Transfer



# (2) add a scenario to the payment feature by only writing Gherkin.
# now tap a transaction and then complete the payment
# Start by un-commenting the line starting with Scenario: and then add Given-When-Then lines.
#
# Extra Instructions:
# -------------------
# Extra step you need to finish this assignment, prefixed each with either Given, When, Then or And:
# I tap on element (.*) with value (.*)
# I tap on the (.*) button on alert with title (.*)

# Scenario: As a user I want to quickly do a payment to a person from the transaction list.




# (3) add a scenario to make a payment until confirmation screen and then navigate back to transaction screen.
# Start by un-commenting the next line.

# Scenario: As a user I want to be able to navigate back to transactions if I do not want to confirm the payment.



# (4) iOS only challenge: Until now you have navigated through the app, and typed text. This only contains implicit verification.
# Now it is time to add explicit verification steps.
# Find the verification step in the glue code and add it to the previous three scenarios.
# Good luck!


# (5) iOS only challenge: exception flow
# Write a Gherkin test script that verifies the popup after submitting an incomplete payment.
