require 'rails_helper'

RSpec.describe "Locale", type: :system do
    let!(:user) { FactoryBot.create(:user) }
    let!(:profile) {FactoryBot.create(:profile, user: user)}
    
    scenario "Switching languages" do
        sign_in user
        visit users_path
        expect(page).to have_content "Users"
        click_link "日本語"
        expect(page).to have_content "ユーザー一覧"
        click_link "中文"
        expect(page).to have_content "用戶"
    end
end