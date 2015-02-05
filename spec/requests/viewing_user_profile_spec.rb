require 'rails_helper'

describe "viewing a user profile" do 

  it "returns the users profile" do
    user1 =  create(:user)
    
    get "/api/v1/users/#{user1.id}/profile"
    
    expect(response).to be_success
    expect(response).to have_http_status(200)
    expect(response.body).to include("pong")

  end 

end 

