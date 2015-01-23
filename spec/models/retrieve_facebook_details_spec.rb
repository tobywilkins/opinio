require 'rails_helper'


describe "RetriveFacebookDetails" do 



  it "can access the facebook graph to get profile details" do
 

token = "CAAI5PzWZBA2cBAFoTTFmQgOmiuxpTZCWBvkvDY9QSRlqXIzXEOm3035ZCg6kr2gMgmvExaJm7mdtVFflsDpwakZAOZBxNnZBfoyF5dpGC37zvn7PdYQjndBvuRkHtVSAy8Oe9Kofl6dxLKOmi0swfSuHWB9x1CpjZBlhUwWePZCwOvZBCmfGaT8spqiubzxJQwYnESfsICmfZB4rBZBVKhlawS7g0N6shAnZBjJF9gWsVnkVrRejHe11HtAh"


    rfd = RetrieveFacebookDetails.new(token)
    expect(rfd.username).to include("justin")
    expect(rfd.name.downcase).to include("justin")
    expect(rfd.email.downcase).to include("@")
  end 

end 
