# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence :name do |n|
      "User#{n}"
    end 
    sequence :email do |n|
      "user#{n}@example.com"
    end 
    sequence :authentication_token do |n|
      "token#{n}"
    end 
    password 'password'
    password_confirmation 'password'
  end
  
end
