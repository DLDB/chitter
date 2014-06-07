Feature: Log in
In order to user chitter
As a maker 
I want to log in

Scenario: Logging in with invalid password
Given I have an account
When I am on the homepage
And I fill in the username incorrectly
And I fill in the password correctly
And I press "Sign In"
Then I should see "Username or Password incorrect"

Scenario: Logging in with invalid username
Given I have an account
When I am on the homepage
And I fill in the username correctly
And I fill in the password incorrectly
And I press "Sign In"
Then I should see "Username or Password incorrect"