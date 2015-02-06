module API 
  class Root < Grape::API
    prefix 'api'
    format :json
    formatter :json, Grape::Formatter::ActiveModelSerializers

    rescue_from :all 
    
    #do |e|
      # Rack::Response.new({
      # error_code: 500,
      # error_message: e.message
      # }.to_json, 500).finish
    # end


    version 'v1', using: :path
    # before do
    #   puts env
    #   error!("401 Unauthorized", 401) unless authenticated
    # end

    helpers do
      def warden
        env['warden']
      end

      def logger
        API.logger
      end

      def authenticated
        t = params[:auth_token]
        puts "authenticating ....with token #{t.to_s}"

        if warden.authenticated?
          return true
        end
                
        if t
          puts "have token"

          found_user =  @user = User.find_by_authentication_token(t)
          puts "found : #{found_user}"
          return found_user 
        end 
      end

      def current_user
        warden.user || @user
      end
    end


   

    # mount the api last  
    mount ::V1::Root 
  end 
end
