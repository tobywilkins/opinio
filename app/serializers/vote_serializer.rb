class VoteSerializer < ActiveModel::Serializer
 
  attributes :id, :poll_id

  has_one :voter


end 
