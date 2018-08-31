class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def after_sign_in_path_for(resource)
    new_profile_path # ログイン後に遷移するpathを設定
  end
  
  private
    def authenticate_user!
      if user_signed_in?
        super
      else
        redirect_to pages_loginpage_path
      end
    end
end
