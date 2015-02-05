require 'rails_helper'

RSpec.describe User, :type => :model do

  it "creates a user given parameters" do
    user = User.new({
      email:"joe@example.com",
      password: "testtest",
      password_confirmation: "testtest",
      name: "joe"
    })

    expect(user.save).to eq(true)
    expect(user.email).to eq("joe@example.com")
    expect(user.name).to eq("joe")
    
    # set token manually
    user.authentication_token = 'xxxx'

    expect(user.save).to eq(true)
    expect(user.email).to eq("joe@example.com")
    expect(user.name).to eq("joe")
    expect(user.authentication_token).to eq("xxxx")
    expect(User.find_by_authentication_token("xxxx").email).to eq("joe@example.com")
  
  end 

  it "creates a user using FB details" do
 
    class Fb
      def id 
        "myuid"
      end
      def email
        "joe@example.com"
      end 
      def name 
        "Jow bloggs"
      end 
    end 

    fb = Fb.new

    @u = User.create_with_facebook(fb)
    expect(@u.email).to eq("joe@example.com")
    expect(@u.uid).to eq("myuid")
 
    @u = User.find_by_provider_uid("facebook","myuid")
    expect(@u.email).to eq("joe@example.com")
    expect(@u.uid).to eq("myuid")


  end 


  it "can have a profile pic" do
  
    user = create(:user)
    expect(user.profile_picture.url).to include("gran.jpg")
  
  end 


  it "calculates statics" do
  
    user = create(:user)
    ## create 3 polls owned by this user
   
    3.times do
      create(:poll, user: user )
    end 

    expect(user.number_of_polls).to eq(3)
    
    ## create a user with 3 poll user one can vote on 
    poll1 = create(:poll)
    poll2 = create(:poll)
    poll3 = create(:poll)
    

    CastVote.new.call(user: user, poll: poll1, vote:"a")
    CastVote.new.call(user: user, poll: poll2, vote:"A")
    expect(user.given_votes).to eq(2)
    CastVote.new.call(user: user, poll: poll3, vote:"b")
    expect(user.given_votes).to eq(3)
  
    
    this_user_poll =  create(:poll, user: user)

    100.times do 
      userx = create(:user)
      CastVote.new.call(user: userx, poll: this_user_poll, vote:"A")
    end 

    expect(user.gotten_votes).to eq(100)


  end 

end
