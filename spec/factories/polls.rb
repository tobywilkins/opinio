FactoryGirl.define do
  
  factory :poll do
    sequence(:title) { |n| "poll #{n}" } 
    image_a File.open(File.join(Rails.root, '/spec/photos/beach.jpg'))
    image_b File.open(File.join(Rails.root, '/spec/photos/mountains.jpg'))
    caption_a { "Option A in poll #{title}" }
    caption_b { "Option B in poll #{title}" } 
    option_a_count 0
    option_b_count 0
    user 
  end

end
