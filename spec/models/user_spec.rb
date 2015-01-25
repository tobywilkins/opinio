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
    
    puts user.inspect
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


end
