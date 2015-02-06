require 'rails_helper'

describe "viewing a poll" do 

  # given a poll called "which shoes "
  # where userA votes A
  # where userB votes A
  # where UserC votes b 
  
  # when viewing a poll 


  it "returns the poll details " do 
    user1 = create(:user)
    user2 = create(:user)
    user3 = create(:user)
    user4 = create(:user)
    user1.polls.create(attributes_for(:poll))
    poll = user1.polls.first 

    expect(poll.title).to eq("poll 1") 
    expect(poll.owner).to eq(user1)

    CastVote.new.call({ poll: poll, vote: "A", user: user2})
    CastVote.new.call({ poll: poll, vote: "A", user: user3})
    CastVote.new.call({ poll: poll, vote: "B", user: user4})

    puts poll.votes.inspect 

    expect(poll.winner).to eq("A") 
    
    @user = FactoryGirl.create(:user, email:"abc@example.com")
    @user.reload
    tok = @user.authentication_token
    

    get "/v1/polls/#{poll.id}?auth_token=#{tok}"
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response.body).to eq("xxx")
  end 
 
  



end 
