require 'rails_helper'

RSpec.describe Poll, :type => :model do

  it "takes a , A ,0, b, B , 1 as choices" do
    user = create(:user)
    poll = create(:poll)
    v = Vote.new
    v.poll = poll
    v.user = user 
    v.choice = "a"
    expect(v.save).to eq(true)
    expect(v.option).to eq(0) 
    expect(v.a?).to eq(true) 
    v.choice = "A"
    expect(v.save).to eq(true)
    expect(v.option).to eq(0) 
    expect(v.a?).to eq(true) 
    v.choice = "0"
    expect(v.save).to eq(true)
    expect(v.option).to eq(0) 
    expect(v.a?).to eq(true) 
    v.choice = "b"
    expect(v.save).to eq(true)
    expect(v.option).to eq(1) 
    expect(v.a?).to eq(false) 
  end 

  it "#cast method works" do
    user = create(:user)
    poll = create(:poll)
    v = Vote.cast(user,poll,"A")
    expect(v.option).to eq(0) 
    expect(v.a?).to eq(true) 
   end 

  
  it "Doesn't not allow a user to vote more than once on a poll"

  it "Requires a user, a poll and a choice"
  
end
