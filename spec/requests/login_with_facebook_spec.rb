require 'rails_helper'

RSpec.describe "logging in with facebook token", :type => :request do
  it "returns a auth token to use with requests" do
    
    post "/api/v1/auth/login", 
      :provider => "facebook", 
      :token => "CAAI5PzWZBA2cBAFoTTFmQgOmiuxpTZCWBvkvDY9QSRlqXIzXEOm3035ZCg6kr2gMgmvExaJm7mdtVFflsDpwakZAOZBxNnZBfoyF5dpGC37zvn7PdYQjndBvuRkHtVSAy8Oe9Kofl6dxLKOmi0swfSuHWB9x1CpjZBlhUwWePZCwOvZBCmfGaT8spqiubzxJQwYnESfsICmfZB4rBZBVKhlawS7g0N6shAnZBjJF9gWsVnkVrRejHe11HtAh"


    expect(response).to be_success
    expect(response).to have_http_status(201)

    expect(JSON.parse(response.body)).to be_has_key("name")
    expect(JSON.parse(response.body)).to be_has_key("authentication_token")

  end
end
 
