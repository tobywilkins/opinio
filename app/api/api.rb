module API 
  class Root < Grape::API
    prefix 'api'
    format :json
  
    version 'v1', using: :path
    before do
      #error!("401 Unauthorized", 404) unless authenticated
    end

    helpers do
      def warden
        env['warden']
      end

      def logger
        API.logger
      end

      def authenticated
        return true if warden.authenticated?
        params[:access_token] && @user = User.find_by_authentication_token(params[:access_token])
      end

      def current_user
        warden.user || @user
      end
    end

    # mount the api last  
    mount ::V1::Root 
  end 
end
