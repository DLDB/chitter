def sign_up(name = 'alice',
            username = '@alicelikesoranges',
            email = "alice@example.com", 
            password = "oranges!", 
            password_confirmation = "oranges!")
  fill_in :name, :with => name
  fill_in :username, :with => username
  fill_in :email, :with => email
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button "Sign Up"
end

def sign_in(username = '@alicelikesoranges', password = "oranges!")
      visit '/'
      fill_in 'username', :with => username
      fill_in 'password', :with => password
      click_button 'Sign In'
  end

Given /^(?:|I )have an account$/ do
  User.create(name: 'alice',
            username: '@alicelikesoranges',
            email: "alice@example.com", 
            password: "oranges!", 
            password_confirmation: "oranges!")
end

Given 'I am not logged in' do
  visit '/'
end

Given /^(?:|I )am logged in$/ do
  create(:user)
  sign_in
end

When /^(?:|I )submit valid sign up information$/ do
  sign_up
end

When /^(?:|I )submit invalid sign up information$/ do
  sign_up('', '', '', 'password', 'psswrd')
end

Then /^([0-9]) users? should be added to the database$/ do |users|
  expect(User.count).to eq users.to_i
end

When /^(?:|I )fill in the username correctly$/ do
  fill_in :username, with: 'alicelikesoranges'
end

When /^(?:|I )fill in the username incorrectly$/ do
  fill_in :username, with: 'alicelikeoranges'
end

When /^(?:|I )fill in the password incorrectly$/ do
  fill_in :password, with: 'orange!'
end

When /^(?:|I )fill in the password correctly$/ do
  fill_in :password, with: 'oranges!'
end

Given(/^there is already a user with the username '@alicelikesoranges'$/) do
  create( :user )
  expect(User.count).to eq 1
end

When(/^I signup with the username '@alicelikesoranges'$/) do
  sign_up
end

Then(/^there should be (\d+) registered users$/) do |arg1|
  expect(User.count).to eq arg1.to_i
end

When(/^I click "(.*?)"$/) do |arg1|
  find(arg1).click
end

When(/^I submit a message$/) do
  fill_in :cheet, with: 'This is a message'
  find('.composeButton').click
end

Then(/^I will see "(.*?)" within "(.*?)"$/) do |arg1, arg2|
  expect(find(arg2)).to have_content(arg1)
end

