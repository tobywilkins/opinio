require 'rails_helper'

describe 'creating a poll' do

  it 'can ping pong' do
  @user = FactoryGirl.create(:user, email:"abc@example.com")
    @user.reload
    expect(@user.email).to eq("abc@example.com")
    expect(@user.authentication_token).to eq("token")
    expect(User.find_by_authentication_token("token")).to eq(@user)
    get "/api/v1/polls/ping?auth_token=#{@user.authentication_token}"

    expect(response).to be_success
    expect(response).to have_http_status(200)

    expect(response.body).to include("pong")
  end 

  it 'should list the polls' do
    @user = FactoryGirl.create(:user, email:"abc@example.com")
    @user.reload
    expect(@user.email).to eq("abc@example.com")
    expect(@user.authentication_token).to eq("token")
    expect(User.find_by_authentication_token("token")).to eq(@user)
    get "/api/v1/polls?auth_token=#{@user.authentication_token}"
    expect(response).to be_success
    expect(response).to have_http_status(200)

  end 


  context "creating a poll" do 

    it "adds a poll to the list" do 
      @user = FactoryGirl.create(:user)
      poll_attrs = {
        auth_token: @user.authentication_token,
        title:      "What car should I buy?", 
        caption_a:  "E200",
        caption_b:  "Camaro",
        image_a: File.open(File.join(Rails.root, '/spec/photos/e200.jpg')),
        image_b: File.open(File.join(Rails.root, '/spec/photos/camaro.jpg'))
      }
      post '/api/v1/polls' , poll_attrs 
      expect(response).to be_success
      expect(response).to have_http_status(201)
   
    end 

    it "returns an errors and details if all the required attributes are not sent" do
      @user = FactoryGirl.create(:user)
      poll_attrs = {
        auth_token: @user.authentication_token,
        title:      "What car should I buy?", 
        caption_b:  "Camaro",
        image_a: File.open(File.join(Rails.root, '/spec/photos/e200.jpg')),
        image_b: File.open(File.join(Rails.root, '/spec/photos/camaro.jpg'))
      }
      post '/api/v1/polls' , poll_attrs 
      expect(response).to be_success
      expect(response).to have_http_status(201)
    end 
  
  end 

end

