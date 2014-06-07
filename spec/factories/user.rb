FactoryGirl.define do
  
  factory :user do
    name 'alice'
    username '@alicelikesoranges'
    email 'alice@example.com'
    password 'oranges!'
    password_confirmation 'oranges!'
  end

end