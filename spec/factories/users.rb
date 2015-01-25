# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'joe'
    email 'joe@example.com'
    authentication_token 'token'
    password 'password'
    password_confirmation 'password'
  end
  
end
