require 'rails_helper'
require 'airborne'

describe 'creating a poll' do

  it 'should list the polls' do
    get '/api/v1/polls'
    expect_status(200)
    expect(json_body.length).to  eq(0)
  end 
  
  it "adds a poll to the list" do 
    # poll_attrs = {
    #   title: "What car should I buy?",
    #   caption_a: "E200",
    #   
    #   caption_b: "Camaro",
    #   photo_b: File.open(File.join(Rails.root, '/spec/photos/camaro.jpg'))
    # }
    poll_attrs = {
      title: "What car should I buy?", 
      caption_a: "E200",
      caption_b: "Camaro",
      photo_a: File.open(File.join(Rails.root, '/spec/photos/e200.jpg'))
    }
    post '/api/v1/polls' , poll_attrs 
    expect_status(201)
    
    # get '/api/v1/polls'
    # expect_status(200)
    # expect(json_body.length).to eq(1)
  end 


end

