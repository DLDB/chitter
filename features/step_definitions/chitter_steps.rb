def sign_up(name = 'alice',
            user_name = 'alicelikesoranges',
            email = "alice@example.com", 
            password = "oranges!", 
            password_confirmation = "oranges!")
  fill_in :name, :with => name
  fill_in :user_name, :with => user_name
  fill_in :email, :with => email
  fill_in :password, :with => password
  fill_in :password_confirmation, :with => password_confirmation
  click_button "Sign Up"
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

Then(/^([0-9]) users? should be added to the database$/) do |users|
  expect(User.count).to eq users.to_i
end

# When(/^I submit invalid sign up information$/) do
#   pending # express the regexp above with the code you wish you had
# end
