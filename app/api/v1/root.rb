  module V1
    class Root < Grape::API
      rescue_from :all 
      
      mount ::V1::Polls
      mount ::V1::Auth
      mount ::V1::Users
    end
  end
