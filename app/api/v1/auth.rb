module V1
  class Auth < API::Root

   resource :auth do
      
      desc "Creates and returns access_token if valid login"
      params do
        requires :provider, type: String, desc: "Facebook for now"
        requires :token,    type: String, desc: "The fookbook token"
      end

      post :login do
    
        auth = AuthUserWithFacebook.new(params[:provider],params[:token])
        result = auth.call
        Rails.logger.info(result.inspect)
        if auth.success?
          return auth.creds
        else
          error!('Unauthorized.', 500)
        end
      end

      desc "Returns pong if logged in correctly"
      params do
        requires :token, type: String, desc: "Access token."
      end
      get :ping do
        authenticate!
        { message: "pong", current_user: current_user}
      end
    end   

  end 
end 

