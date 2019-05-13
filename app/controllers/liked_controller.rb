class LikedController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :only_profile_user,  only: [:index]
  
  def index
    user_followers = current_user.followers - User.matching(current_user)
    @users = user_followers
  end
end
