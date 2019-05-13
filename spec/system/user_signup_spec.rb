require 'rails_helper'

RSpec.describe "Sign up and create profile", type: :system do
  
  scenario "user's start up from sign up to creating a profile" do
    visit pages_loginpage_path
    
    # sign up
    expect {
      click_link "Sign up"
      fill_in "Email", with: "example@example.com"
      fill_in "Password", with: "Testuser"
      fill_in "Password confirmation", with: "Testuser"
      click_button "Sign in"

      aggregate_failures do
        expect(page).to have_content "A message with a confirmation link has been sent to your email address. Please follow the link to activate your account."
        expect(page).to have_content "Welocome To Tapioca!"
      end
    }.to change(User, :count).by(1)
    
    # mail confirmation
    mail = ActionMailer::Base.deliveries.last
    url = extract_confirmation_url(mail)
    visit url
    expect(page).to have_content "Your email address has been successfully confirmed."
    
    fill_in "Email", with: "example@example.com"
    fill_in "Password", with: "Testuser"
    click_button "Log in"

    aggregate_failures do
      expect(page).to have_content "Signed in successfully."
      expect(page).to have_content "Setting my profile"
    end
    
    # create a profile
    expect {
      attach_file "profile[image]", "#{Rails.root}/spec/files/sample_avatar.png"
      fill_in "Username", with: "Test user"
      select "male", from: "Gender"
      fill_in "Birth", with: "1988/01/01"
      select "japan", from: "Nationality"
      fill_in "Height", with: "180"
      select "student", from: "Occupation"
      fill_in "Singleword", with: "Hellow world"
      click_button "Create account"

      aggregate_failures do
        expect(page).to have_content "created profile successfully"
        expect(page).to have_content "Users"
      end
    }.to change(Profile, :count).by(1)
    
  end
  
  def extract_confirmation_url(mail)
    body = mail.body.encoded
    body[/http[^"]+/]
  end
  
end