class CastVote

  def call(poll, vote, user)
    @poll = poll 

    @vote = @poll.votes.build
    @vote.option = vote
    @vote.save
  end 

end 
