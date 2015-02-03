class CastVote
  def call(opts)
    poll = opts[:poll]
    vote = opts[:vote]
    user = opts[:user]
    Vote.cast(user,poll,vote) 
  end 
end 
