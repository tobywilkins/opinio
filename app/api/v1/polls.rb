  module V1
    class Polls < Grape::API
      version 'v1', using: :path
      format :json

      helpers do
        def declared_params
          declared(params, include_missing: false)
        end
      end

      resource :polls do
       
        desc "Return list of recent posts"
        get do
          Poll.all
        end

        params do
          requires :title, type: String
          requires :caption_a, type: String
          requires :caption_b, type: String
          requires :caption_b, type: String
          # for binary file you can omit type 
          requires :image_a
          requires :image_b

        end
        
        post do 
          Poll.create!(declared_params)
        end 

        params do
          requires :which, type: String, regexp: /^(A|B)$/
        end 
        post ':id/vote' do
          @poll = Poll.find(params[:id])
          CastVote.new.call(@poll,params[:which],nil)
          @poll.to_json
          puts "#{declared_params} to #{params[:id]} in votes"
        end
      end
    end
  end
