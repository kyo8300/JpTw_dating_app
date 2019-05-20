require 'rails_helper'

RSpec.describe "Search", type: :system do
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
   
  scenario "Search user2" do
    sign_in user1
    visit root_path
    click_button "Search", match: :first
    
    fill_in "username", with: "Kej"
    fill_in "height1", with: "160"
    fill_in "height2", with: "180"
    fill_in "age1", with: "19"
    fill_in "age2", with: "25"
    select "doctor", from: "Occupation"
    click_on "commit"

    expect(page).to have_content "Keji"
  end
  
end