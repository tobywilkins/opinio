class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable

  before_save :ensure_authentication_token

  has_many :polls, dependent: :destroy
  has_many :votes, dependent: :destroy


  mount_uploader :profile_picture, ProfilePictureUploader
    
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


  def number_of_polls
    polls.count
  end 

  def given_votes
    votes.count
  end 

  def gotten_votes
    count = 0
    polls.each do |p|
      count = count + p.votes.count
    end 
    count
  end 

  private

  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end

end
