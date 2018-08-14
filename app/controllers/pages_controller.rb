class PagesController < ApplicationController
  def home
    render 'loginpage' unless user_signed_in?
  end
  
  def loginpage
  end  
end
