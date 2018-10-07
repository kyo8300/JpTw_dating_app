class MatchingController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :only_profile_user,  only: [:index, :show]
  
  def index
    @users = User.matching(current_user)
  end

  def show
    session[:user_id] = current_user.id
    @user = User.find(params[:id])
    @room_id = message_room_id(current_user,@user)
    @messages = Message.recent_in_room(@room_id)
    
  end
  
  private
  
    def message_room_id(first_user, second_user)
      first_id = first_user.id.to_i
      second_id = second_user.id.to_i
      if first_id < second_id
        "#{first_user.id}-#{second_user.id}"
      else
        "#{second_user.id}-#{first_user.id}"
      end
    end
end
