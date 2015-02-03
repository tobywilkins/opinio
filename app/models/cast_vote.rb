class CastVote

  def call(poll, vote, user)
    @poll = poll 

    @vote = @poll.votes.build

    o = 0 if vote == "a" || vote == "A"
    @vote.option = vote
    @vote.save
  end 

end 
