require 'rails_helper'

RSpec.describe User, :type => :model do

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
