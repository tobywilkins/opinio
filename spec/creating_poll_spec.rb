require 'rails_helper'
require 'airborne'

describe 'creating a poll' do

  it 'should list the polls' do
    get '/api/v1/polls'
    expect_status(200)
    expect(json_body.length == 0)
  end 


    #it "adds a poll to the list" do 
    


    # poll_attrs = {
    #   title: "What car should I buy?",
    #   caption_a: "E200",
    #   photo_a: File.open(File.join(Rails.root, '/spec/photos/e200.jpg')),
    #   caption_b: "Camaro",
    #   photo_b: File.open(File.join(Rails.root, '/spec/photos/camaro.jpg'))
    # }

    # post '/api/v1/polls' , poll_attrs 
    # expect_json_types({status: "200", id: :int})
  # end 


end

