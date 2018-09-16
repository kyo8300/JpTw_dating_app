class ProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update,:destroy]
  before_action :only_profile_user,  only: [:edit, :update, :destroy]
  before_action :set_profile, only: [:edit, :update]
  
  
  def new
    @profile = current_user.build_profile
  end

  def create
    
    @profile = current_user.build_profile(profile_params)
    @profile.user_id = current_user.id 
    @profile.age = @profile.calage
    
    
    if @profile.save
      if @profile.age < 18
        @profile.destroy
=begin
        current_user.destroy
=end        
        redirect_to pages_loginpage_path , notice: "only more than 18 years old users can use this app."
      else
        @profile.save
        redirect_to root_path, notice: "created profile successfully"
      end  
    else
      render 'new'
    end  
  end

  def edit
  end
  
  def update
    if @profile.update_attributes(profile_params)
      # Success
      flash[:success] = "Profile updated"
      redirect_to root_path
    else
      # Failure
      # => @user.errors.full_messages()
      render 'edit'
    end
  end

  def destroy
  end
  
  private
      
      def profile_params
          params.require(:profile).permit(
              :username, :sex, :birth, 
              :age, :nationality, :height, 
              :occupation, :singleword, :image
          )
      end 
      
      def set_profile
        @profile = Profile.find(current_user.profile.id)
      end  
end
