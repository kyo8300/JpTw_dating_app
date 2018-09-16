class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create,:show, :edit, :update]
    before_action :only_profile_user,  only: [:index, :show]
    
    def index
        
        if current_user.profile.female?
            if current_user.profile.taiwan?
                @profiles = Profile.where('nationality = ? and sex = ?', 0, 1)
            else
                @profiles = Profile.where('nationality = ? and sex = ?', 1, 1)
            end    
        else
            if current_user.profile.taiwan?
                @profiles = Profile.where('nationality = ? and sex = ?', 0, 0)
            else
                @profiles = Profile.where('nationality = ? and sex = ?', 1, 0)
            end    
        end
    end
    
    def show
        @user = User.find(params[:id])
        @relationship = Relationship.new
    end  
    
end
