class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:index, :create,:show, :edit, :update]
    
    def index
=begin
        if current_user.female?
            @users = User.male
        else
            @users = User.female
        end
=end
    end
    
    def show
    end  
    
end
