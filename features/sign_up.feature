Feature: Sign up
In order to use chitter 
as a maker 
I want to sign up to the service

Scenario: When the user completes an invalid sign up
Given I am on the homepage
And I press "Sign up"
Then I submit invalid sign up information
Then 0 users should be added to the database
And I should see "Your password and password confirmation must match"

Scenario: When the user completes a valid sign up
Given I am on the homepage
And I press "Sign up"
When I submit valid sign up information
Then 1 user should be added to the database
Then I should see "Sign up successful"

