class LikedController < ApplicationController
  def index
    user_followers = current_user.followers - User.matching(current_user)
    @users = user_followers
  end
end
