class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :number_of_polls, :given_votes, :gotten_votes


  def serializable_hash
    d = {
    
      id: object.id,
      name: object.name
    }

    d.merge stats
  end


  private

  def stats
    stats = {
      number_of_polls: object.number_of_polls,
      given_votes: object.given_votes,
      gotten_votes: object.gotten_votes
    }

    return { stats: stats }
  end 

end 
