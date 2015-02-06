class PollSerializer < ActiveModel::Serializer
  
  attributes :id, :title 
  attributes :image_a, :caption_a
  attributes :image_b, :caption_b
  attributes :total_votes, :winner 
  #attributes :voted_a,:voted_b 
  
  has_one :owner, :key => :user
  has_many :a_voters
  has_many :b_voters


end
