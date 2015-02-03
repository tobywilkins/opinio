FactoryGirl.define do
  
  factory :poll do
    title "Where should I go on holiday?"
    image_a File.open(File.join(Rails.root, '/spec/photos/beach.jpg'))
    image_b File.open(File.join(Rails.root, '/spec/photos/mountains.jpg'))
    caption_a "The Beach"
    caption_b "The Mountains"
    option_a_count 0
    option_b_count 0
    user 
  end

end
