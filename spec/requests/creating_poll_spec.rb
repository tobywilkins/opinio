require 'rails_helper'

describe "API" do

  describe "GET /api/v1/polls" do
    it "returns an empty array of polls" do
      get "/api/v1/polls"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)).to eq([])
    end
    
    
    it "returns a poll" do
      poll = FactoryGirl.create(:poll)
      
      get "/api/v1/polls"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).length).to eq(1)
    end
 

    it "adds a poll to the list" do 
      poll_attrs = {
        title: "What car should I buy?", 
        caption_a: "E200",
        caption_b: "Camaro",
        image_a: File.open(File.join(Rails.root, '/spec/photos/e200.jpg'))
      }
      post '/api/v1/polls' , poll_attrs 
      expect(response.status).to eq(201)

      get "/api/v1/polls"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).length).to eq(1)
    end 

    it "allows you to vote A or B on a poll" do
      poll = FactoryGirl.create(:poll)
      post "/api/v1/polls/#{poll.id}/vote", { which: "A"}
      expect(response.status).to eq(201)
      # puts poll.inspect
    end 
  end



end

