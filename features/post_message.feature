Feature: Post a message
In order to let people know what I am doing
As a maker 
I want to post a message to chitter

Scenario: post a message
Given I am logged in
When I submit a message
Then I will see "This is a message" within "#chitterPipe"