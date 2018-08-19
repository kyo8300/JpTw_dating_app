class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :show, :edit, :update]
    
    def index
        if current_user.female?
            @users = User.male
        else
            @users = User.female
        end    
    end
    
    def show
    end    
    
    def edit
        @user = User.find(params[:id])
    end    
    
    def update
    end
    
    
    private
      
      def user_params
          params.require(:user).permit(
              :username, :sex, :birth, 
              :age, :nationality, :height, 
              :occupation, :singleword
          )
      end      
end
