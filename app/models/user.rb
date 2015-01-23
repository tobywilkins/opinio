class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable



#  attr_accessible :name, :email, :authentication_token

  before_save :ensure_authentication_token

  def ensure_authentication_token
    self.authentication_token ||= generate_authentication_token
  end


  def self.create_with_facebook(fbhash)
 
    p = Devise.friendly_token

    user = self.create!({
      uid: fbhash.id,
      provider: "facebook",
      password: p, 
      password_confirmation: p, 
      email: fbhash.email,
      name: fbhash.name
    
    })
    
    return user 
  end 

  def self.find_by_provider_uid(provider,uid)
    where(provider: provider, uid: uid ).take    
  end 

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end




end
