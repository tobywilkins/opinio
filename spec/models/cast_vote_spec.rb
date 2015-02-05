require 'rails_helper'

RSpec.describe Poll, :type => :model do

  it "Should only allow one vote per poll" do
      
      user1 = create(:user)
      user2 = create(:user)
      user2.polls.create(attributes_for(:poll))
      poll = user2.polls.first 

      res =  CastVote.new.call({ poll: poll, vote: "A", user: user1})
      expect(Vote.count).to eq(1)
      id = res[:vote][:id]
      expect(Vote.find(id).option).to eq(0)
      
      res =  CastVote.new.call({ poll: poll, vote: "A", user: user1})
      id = res[:vote][:id]
      expect(Vote.find(id).option).to eq(0)
      expect(Vote.count).to eq(1)
      
      res = CastVote.new.call({ poll: poll, vote: "B", user: user1})
      id = res[:vote][:id]
      vote = Vote.find(id)
      expect(Vote.find(id).option).to eq(1)
      expect(Vote.count).to eq(1)
  
  end 
end 

