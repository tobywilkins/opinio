  module V1
    class Root < Grape::API
      mount ::V1::Polls
      mount ::V1::Auth
    end
  end
