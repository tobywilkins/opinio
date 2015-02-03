require 'rails_helper'

RSpec.describe Vote, :type => :model do
  
  it { should validate_presence_of(:poll) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:option) }
  
  
  it "takes a , A ,0, b, B , 1 as choices" do
    
    user = create(:user)
    poll = create(:poll)
    
    v = Vote.new
    v.poll = poll
    v.user = user 
    v.choice = "a"
    s = v.save
    
    expect(s).to eq(true)
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
   
  it "allows a user to change their vote" do
    
    user = create(:user)
    poll = create(:poll)
    v = Vote.cast(user,poll,"A")
    expect(v.option).to eq(0) 
    expect(v.a?).to eq(true) 
    id = v.id
    v2 = Vote.cast(user,poll,"B")
    expect(v2.id).to eq(id)

  end

  it { should validate_uniqueness_of(:option).scoped_to([:poll_id, :user_id]) }
  
end
