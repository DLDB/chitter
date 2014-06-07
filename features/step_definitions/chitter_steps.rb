def sign_up(name = 'alice',
            username = 'alicelikesoranges',
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

Given /^(?:|I )have an account$/ do
  User.create(name: 'alice',
            username: 'alicelikesoranges',
            email: "alice@example.com", 
            password: "oranges!", 
            password_confirmation: "oranges!")
end

Given 'I am not logged in' do
  visit '/'
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
  fill_in :password, with: 'psswrd'
end

When /^(?:|I )fill in the password correctly$/ do
  fill_in :password, with: 'passwrd'
end

