class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_locale
  
  def after_sign_in_path_for(resource)
    if current_user.profile.nil?
      new_profile_path # ログイン後に遷移するpathを設定
    else
      root_path
    end  
  end
  
  def default_url_options(options = {})
    { :locale => I18n.locale }
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
    
    def set_locale
      I18n.locale = locale_in_params || locale_in_accept_language || I18n.default_locale
    end

    def locale_in_params
      if params[:locale].present?
        params[:locale].to_sym.presence_in(I18n::available_locales) || I18n.default_locale
      else
        nil
      end
    end
    
    def locale_in_accept_language
      request.env['HTTP_ACCEPT_LANGUAGE'].to_s.split(',').map{ |_| _[0..1].to_sym}.select {|_| I18n::available_locales.include?(_)}.first
    end
end
