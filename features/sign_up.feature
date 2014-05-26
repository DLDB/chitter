Feature: Sign up
In order to use chitter 
as a maker 
I want to sign up to the service

Scenario: When the user does not have an account
Given I am not logged in
When I am on the homepage
Then I should see "Please sign up"

Scenario: When the user completes an invalid sign up
Given I am not logged in
When I submit invalid sign up information
Then 0 users should be added to the database

Scenario: When the user completes a valid sign up
Given I am not logged in
When I submit valid sign up information
Then 1 user should be added to the database
Then I should see "Sign up successful"