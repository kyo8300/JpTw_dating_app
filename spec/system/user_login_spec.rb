require 'rails_helper'

RSpec.describe "Sign in", type: :system do
  let!(:user) { FactoryBot.create(:user) }
  let!(:profile) {FactoryBot.create(:profile, user: user)}

  scenario "user log in" do
    visit pages_loginpage_path
    click_link "Login"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    
    click_button "Log in"
    
    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Users"
  end
  
end