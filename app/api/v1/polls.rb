  module V1
    class Polls < Grape::API
      version 'v1'
      format :json

      resource :polls do
        desc "Return list of recent posts"
        get do
          Poll.all
        end
      end
    end
  end
