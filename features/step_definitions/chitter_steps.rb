Given 'I am not logged in' do
  visit '/'
end

When(/^I submit valid information$/) do
  fill_in 'name', with: 'Joe Microbloggs'
  fill_in 'email', with: 'joe@microbloggs.com'
  fill_in 'password', with: 'password'
  click_button 'Sign Up'
end

Then(/^a user should be added to the database$/) do
  expect(User.count).to eq 1
end