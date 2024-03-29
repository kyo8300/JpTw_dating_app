class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create, :destroy]
  before_action :only_profile_user,  only: [:index, :create, :destroy]
  
  def index
     non_matchers = current_user.following - current_user.matchers
     @users = Kaminari.paginate_array(non_matchers).page(params[:page]).per(10)
  end
    
  def create
    @relationship = current_user.active_relationships.new(create_params)
    if @relationship.save
      @follower_user = current_user
      @following_user = User.find(params["following_id"])
      @matching = @following_user.following?(current_user)

      respond_to do |format|
        format.json
      end
    else
      render :template => "users/show"
    end
  end

  def destroy
    user = Relationship.find(params[:id]).following
    current_user.unfollow(user)
    redirect_to controller: 'matching', action: 'index'
  end

  private

  def create_params
    params.permit(:following_id)
  end

end