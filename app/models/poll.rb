class Poll < ActiveRecord::Base

  mount_uploader :image_a, PollImageUploader
  mount_uploader :image_b, PollImageUploader

  has_many :votes
   
end
