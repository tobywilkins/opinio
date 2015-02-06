class CastVote
  def call(opts)
    poll = opts[:poll]
    vote = opts[:vote]
    user = opts[:user]
    vote =  Vote.cast(user,poll,vote) 
    if vote.save
      return { message: "success", vote: { id: vote.id , user: vote.voter }}
    else
      return { message: "failure", error: vote.errors }
    end 
  end 
end 
