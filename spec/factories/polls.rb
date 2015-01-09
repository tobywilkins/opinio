# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poll do
    title "MyString"
    image_a "MyString"
    image_b "MyString"
    caption_a "MyString"
    caption_b "MyString"
    option_a_count 1
    option_b_count 1
    user_id ""
  end
end
