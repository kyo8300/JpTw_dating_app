class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    if current_user.profile.nil?
      new_profile_path # ログイン後に遷移するpathを設定
    else
      root_path
    end  
  end
  
  private
    def only_profile_user
      if current_user.profile.nil?
        redirect_to new_profile_path
      end  
    end  
    
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to pages_loginpage_path
      end
    end
end
