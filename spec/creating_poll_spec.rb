require 'rails_helper'

describe 'creating a poll' do

  it 'should list the polls' do
    @user = FactoryGirl.create(:user)
    
    get "/api/v1/polls?auth_token=#{@user.authentication_token}"
    expect(last_response.status).to eq(200)
  end 
  
  it "adds a poll to the list" do 
    @user = FactoryGirl.create(:user)
    # poll_attrs = {
    #   title: "What car should I buy?",
    #   caption_a: "E200",
    #   
    #   caption_b: "Camaro",
    #   photo_b: File.open(File.join(Rails.root, '/spec/photos/camaro.jpg'))
    # }
    poll_attrs = {
      auth_token: @user.authentication_token,
      title:      "What car should I buy?", 
      caption_a:  "E200",
      caption_b:  "Camaro",
      image_a: File.open(File.join(Rails.root, '/spec/photos/e200.jpg')),
      image_b: File.open(File.join(Rails.root, '/spec/photos/camaro.jpg'))
    }
    puts poll_attrs.inspect
    post '/api/v1/polls' , poll_attrs 
    expect(last_response.status).to eq(201)
    
    # get '/api/v1/polls'
    # expect_status(200)
    # expect(json_body.length).to eq(1)
  end 


end

