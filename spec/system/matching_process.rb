require 'rails_helper'

RSpec.describe "Matching", type: :system do
  let!(:user1) { FactoryBot.create(:user) }
  let!(:profile1) {FactoryBot.create(:profile, user: user1)}
  
  let!(:user2) {FactoryBot.create(:user)}
  let!(:profile2){ Profile.create(
      username: "Keji",
      birth: "1998-09-21",
      height: 170,
      occupation: "doctor",
      sex: "female",
      nationality: "taiwan",
      age: 20,
      user: user2
   )}
   
  before do
    user2.follow(user1)
  end
   
  scenario "user1 matched user2", js: true do
    
    sign_in user1
    visit root_path
    
    click_link "Like from other people"
    click_link "Keji 20歳"
    
    click_button "Like"
    expect(page).to have_content "You are matched!"
    visit current_path
    
    expect(page).to have_content "Already matched"
  end
  
end