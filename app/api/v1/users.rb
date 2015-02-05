module V1
  
  module Entities
    class User < Grape::Entity
      expose :name
      expose :given_votes
      expose :gotten_votes
      expose :member_since
      expose :number_of_polls
      expose :picture
    end 
  end 
  
  class Users < Grape::API
  
    version 'v1', user: :path
    format :json

    desc "View a users profile"
    resources :users do
      get ':id/profile' do
        @user = User.find(params[:id])
        present :profile, @user, with: V1::Entities::User
      end 
    end
  
  end 
end
