class AuthUserWithFacebook

  def initialize(provider,token)
    @provider = provider
    @token = token 
    @creds = nil
  end 

  def call
    # lookup user at facebook

# {"id"=>"10154996964025618", 
# "email"=>"justin.maccarthy@gmail.com", "first_name"=>"Justin", "gender"=>"male", "last_name"=>"M", "link"=>"https://www.facebook.com/justin.m.106", "locale"=>"en_GB", "name"=>"Justin M", "timezone"=>7, "updated_time"=>"2014-02-07T15:15:15+0000", "username"=>"justin.m.106", "verified"=>true}

    # get the UID
    fbauth = RetrieveFacebookDetails.new(@token)
    fbauth.call
    
    if fbauth.error?
      return fbauth.error
    end 
    
    @uid = fbauth.id

    # find the user by provider and UID
    @user = User.find_by_provider_uid(@provider, @uid)
  
    # if there is no user, create it 
    if (!@user)
      @user = User.create_with_facebook(fbauth)
    end 

    @creds = {
      name: @user.name,
      authentication_token: @user.authentication_token
    }
      
  end 

  def success?
    true
  end 

  def creds
    @creds
  end 

end 
