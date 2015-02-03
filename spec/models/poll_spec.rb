require 'rails_helper'

RSpec.describe Poll, :type => :model do

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image_a) }
    it { should validate_presence_of(:image_b) }
    it { should validate_presence_of(:caption_a) }
    it { should validate_presence_of(:caption_b) }


    it "Should list all the vote details" do
    
      user1 = create(:user)
      user2 = create(:user)
      user3 = create(:user)
      user4 = create(:user)
      user1.polls.create(attributes_for(:poll))
      poll = user1.polls.first 

      CastVote.new.call({ poll: poll, vote: "A", user: user2})
      CastVote.new.call({ poll: poll,vote: "A",user: user3})
      CastVote.new.call({ poll: poll,vote: "B",user: user4})

      expect(poll.votes.length).to eq(3)
      expect(poll.choose_a).to eq([user2,user3])
      expect(poll.choose_b).to eq([user4])

      CastVote.new.call({ poll: poll, vote: "B",user: user3})
      expect(poll.choose_a).to eq([user2])
      expect(poll.choose_b).to eq([user4,user3])
      expect(poll.total_votes).to eq(3)
      expect(poll.votes.length).to eq(3)
    end 
    

end
