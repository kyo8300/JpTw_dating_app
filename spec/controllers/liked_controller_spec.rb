require 'rails_helper'

RSpec.describe LikedController, type: :controller do
    describe "#index" do
        let!(:user) {FactoryBot.create(:user)}
        
        context "as a logged in user" do
            before do
                @profile = FactoryBot.create(:profile, user: user)
            end
            
            it "responds successfully" do
                sign_in user
                get :index
                expect(response).to be_success
            end

        end
        
        context "as a non-profile user" do
            it "returns a 302 resonse" do
                sign_in user
                get :index
                expect(response).to have_http_status "302"
            end
            
            it "redirects new profile page" do
                sign_in user
                get :index
                expect(response).to redirect_to new_profile_path
            end
        end
        
        context "as a guest" do
            before do
                @profile = FactoryBot.create(:profile, user: user)
            end
            it "returns a 302 response" do
                get :index
                expect(response).to have_http_status "302"
            end
            
            it "redirects loginpage path" do
                get :index
                expect(response).to redirect_to pages_loginpage_path
            end
            
        end
    end
end
