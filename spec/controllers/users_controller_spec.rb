require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    before do
        @user = FactoryBot.create(:user)
        @profile = FactoryBot.create(:profile, user: @user)
    end
    
    describe "#index" do
        context "as an authenticatted user" do
            it "responds successfully" do
                sign_in @user
                get :index
                aggregate_failures do
                    expect(response).to be_success
                    expect(response).to have_http_status "200"
                end
            end
        end
        
        context "as an guest" do
            it "redirects to loginpage path" do
                get :index
                aggregate_failures do
                    expect(response).to_not be_success
                    expect(response).to have_http_status "302"
                    expect(response).to redirect_to pages_loginpage_path
                end
            end
        end
        
        context "as a non-profile user" do
            before do
                @other_user = FactoryBot.create(:user)
            end
            
            it "redirects to new profile path" do
                sign_in @other_user
                get :index
                aggregate_failures do
                    expect(response).to_not be_success
                    expect(response).to have_http_status "302"
                    expect(response).to redirect_to new_profile_path
                end
            end
            
        end
        
    end
    
    describe "#show" do
        context "as an authenticatted user" do
            it "responds successfully" do
                sign_in @user
                get :show , params: {id: @user.id}
                expect(response).to be_success
            end
        end
        
        context "as a non-profile user" do
            before do
                @other_user = FactoryBot.create(:user)
            end
            
            it "redirects to new profile path" do
                sign_in @other_user
                get :show, params: {id: @other_user.id}
                aggregate_failures do
                    expect(response).to_not be_success
                    expect(response).to have_http_status "302"
                    expect(response).to redirect_to new_profile_path
                end
            end
            
        end
        
        context "as an guest" do
            it "responds unsuccessfully" do
                get :show, params: {id: @user.id}
                aggregate_failures do
                    expect(response).to_not be_success
                    expect(response).to have_http_status "302"
                    expect(response).to redirect_to pages_loginpage_path
                end
            end
        end
    end
end
