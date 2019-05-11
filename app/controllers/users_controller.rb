class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show]
    before_action :only_profile_user,  only: [:index, :show]
    
    def index
        
        if current_user.profile.female?
            if current_user.profile.taiwan?
                @profiles = Profile.where('nationality = ? and sex = ?', 0, 1).page(params[:page]).per(21)
                # パラメータとして名前か性別を受け取っている場合は絞って検索する
                if params[:username].present?
                  @profiles = @profiles.get_by_username params[:username]
                end
                
                if params[:occupation].present?
                  @profiles = @profiles.get_by_occpation params[:occupation]
                end
                
                if params[:height1].present?
                  @profiles = @profiles.get_by_height1 params[:height1]
                end
                
                if params[:height2].present?
                  @profiles = @profiles.get_by_height2 params[:height2]
                end
                
                if params[:age1].present?
                  @profiles = @profiles.get_by_age1 params[:age1]
                end
                
                if params[:age2].present?
                  @profiles = @profiles.get_by_age2 params[:age2]
                end
            else
                @profiles = Profile.where('nationality = ? and sex = ?', 1, 1).page(params[:page]).per(21)
                # パラメータとして名前か性別を受け取っている場合は絞って検索する
                if params[:username].present?
                  @profiles = @profiles.get_by_username params[:username]
                end
                
                if params[:occupation].present?
                  @profiles = @profiles.get_by_occpation params[:occupation]
                end
                
                if params[:height1].present?
                  @profiles = @profiles.get_by_height1 params[:height1]
                end
                
                if params[:height2].present?
                  @profiles = @profiles.get_by_height2 params[:height2]
                end
                
                if params[:age1].present?
                  @profiles = @profiles.get_by_age1 params[:age1]
                end
                
                if params[:age2].present?
                  @profiles = @profiles.get_by_age2 params[:age2]
                end
            end    
        else
            if current_user.profile.taiwan?
                @profiles = Profile.where('nationality = ? and sex = ?', 0, 0).page(params[:page]).per(21)
                # パラメータとして名前か性別を受け取っている場合は絞って検索する
                if params[:username].present?
                  @profiles = @profiles.get_by_username params[:username]
                end
                
                if params[:occupation].present?
                  @profiles = @profiles.get_by_occpation params[:occupation]
                end
                
                if params[:height1].present?
                  @profiles = @profiles.get_by_height1 params[:height1]
                end
                
                if params[:height2].present?
                  @profiles = @profiles.get_by_height2 params[:height2]
                end
                
                if params[:age1].present?
                  @profiles = @profiles.get_by_age1 params[:age1]
                end
                
                if params[:age2].present?
                  @profiles = @profiles.get_by_age2 params[:age2]
                end
            else
                @profiles = Profile.where('nationality = ? and sex = ?', 1, 0).page(params[:page]).per(21)
                # パラメータとして名前か性別を受け取っている場合は絞って検索する
                if params[:username].present?
                  @profiles = @profiles.get_by_username params[:username]
                end
                
                if params[:occupation].present?
                  @profiles = @profiles.get_by_occpation params[:occupation]
                end
                
                if params[:height1].present?
                  @profiles = @profiles.get_by_height1 params[:height1]
                end
                
                if params[:height2].present?
                  @profiles = @profiles.get_by_height2 params[:height2]
                end
                
                if params[:age1].present?
                  @profiles = @profiles.get_by_age1 params[:age1]
                end
                
                if params[:age2].present?
                  @profiles = @profiles.get_by_age2 params[:age2]
                end
            end    
        end
    end
    
    def show
        @user = User.find(params[:id])
        @relationship = Relationship.new
    end  
    
end
