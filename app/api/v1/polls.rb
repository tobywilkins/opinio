  module V1
    
    # module Entities
    #   class Poll < Grape::Entity

    #     expose :id, documentation: { type: "String", desc: "ID." }
    #     expose :title, documentation: { type: "String", desc: "The Title of the poll" } 
    #     expose :caption_a, documentation: { type: "String", desc: "Caption for option A." }
    #     expose :caption_b, documentation: { type: "String", desc: "Caption for  option B" }
    #     expose :image_a, documentation: {  desc: "The image for option A." }
    #     expose :image_b, documentation: {  desc: "The image for option B." }
    #   end  
    # end 


    class Polls < Grape::API
      version 'v1', using: :path
      format :json
    
      before do
       error!("401 Unauthorized", 401) unless authenticated
     end

      helpers do
        def declared_params
          declared(params, include_missing: false)
        end
      end

      resource :polls do
       
        desc "Return list of recent polls"
        get do
          Poll.all
        end

        desc "Create a new poll" 
        # do
        #   params do
        #     #requires :all, using: API::Entities::Poll.documentation.except(:id)
        #   end
        # end 

        post do 
          @poll = Poll.create(declared_params)
        end 

        params do
          requires :which, type: String, regexp: /^(A|B)$/
        end 
        post ':id/vote' do
          @poll = Poll.find(params[:id])
          CastVote.new.call({
              poll: @poll, 
              vote: params[:which], 
              user:nil
          })
          @poll.to_json
          puts "#{declared_params} to #{params[:id]} in votes"
        end
        
        desc "Returns pong if logged in correctly"
        params do
          requires :auth_token, type: String, desc: "Access token."
        end

        get 'ping' do
          { message: "pong", current_user: current_user}
        end 


      end # resource 
    end
  end
