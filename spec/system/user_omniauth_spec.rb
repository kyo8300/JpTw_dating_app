require 'rails_helper'

RSpec.describe "OmniAuth", type: :system do
    
  scenario "sign up with Facebook and Log in again" do
      visit pages_loginpage_path
      click_link "Sign up"
      
      click_link "Sign in with Facebook"
      facebook_mock
      expect(page).to have_content "Successfully authenticated from Facebook account."
      expect(page).to have_content "Setting my profile"
      
      click_link "Log Out"
      expect(page).to have_content "Welocome To Tapioca!"
      
      click_link "Login"
      click_link "Log in with Facebook"
      facebook_mock
      expect(page).to have_content "Successfully authenticated from Facebook account."
      expect(page).to have_content "Setting my profile"
  end
  
  scenario "sign up with Google and Log in again" do
      visit pages_loginpage_path
      click_link "Sign up"
      
      click_link "Sign in with Google"
      google_mock
      expect(page).to have_content "Successfully authenticated from Google_oauth2 account."
      expect(page).to have_content "Setting my profile"
      
      click_link "Log Out"
      expect(page).to have_content "Welocome To Tapioca!"
      
      click_link "Login"
      click_link "Log in with Google"
      google_mock
      expect(page).to have_content "Successfully authenticated from Google_oauth2 account."
      expect(page).to have_content "Setting my profile"
  end

end