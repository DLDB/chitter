Feature: Log out
In order to avoid others to use my account
As a maker 
I want to log out

Scenario: Logging out
Given I am logged in
When I click "#settingsLogo"
Then I should see "Good bye!"