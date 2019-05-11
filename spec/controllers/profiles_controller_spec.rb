require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
    before do 
        @user = FactoryBot.create(:user)
    end
    
    describe "#create" do
        
        context "as an authenticated user" do
            it "creates a profile" do
                profile_params = FactoryBot.attributes_for(:profile)
                sign_in @user
                post :create, params: { profile: profile_params }
                aggregate_failures do
                    expect(response).to redirect_to root_path
                    expect(flash[:notice]).to eq 'created profile successfully'
                end
            end
        end
        
        context "as a guest" do
            it "doesn't create a profile" do 
                profile_params = FactoryBot.attributes_for(:profile)
                post :create, params: { profile: profile_params }
                expect(response).to redirect_to pages_loginpage_path
            end
        end
        
        context "as a less than 18 years old user" do 
            it "redirects to login page" do 
                profile_params = FactoryBot.attributes_for(:profile, :underage)
                sign_in @user
                post :create, params: { profile: profile_params }
                aggregate_failures do
                  expect(response).to redirect_to pages_loginpage_path
                  expect(flash[:notice]).to eq 'only more than 18 years old users can use this app.'
                end
            end
        end
    end
    
    describe "#update" do
        before do 
            @profile = FactoryBot.create(:profile, user: @user)
        end
        
        context "as an authenticated user" do
            it "creates a profile" do
                profile_params = FactoryBot.attributes_for(:profile, username: "TestUser2")
                sign_in @user
                patch :update, params: { id: @profile, profile: profile_params }
                aggregate_failures do
                    expect(@profile.reload.username).to eq "TestUser2"
                    expect(flash[:success]).to eq 'Profile updated'
                end
            end
        end
        
        context "as an unauthorized user" do
            before do
                other_user = FactoryBot.create(:user)
                @other_profile = FactoryBot.create(:profile, user: other_user, username: "Old Name")
            end
            
            it "doesn't update a project" do 
                profile_params = FactoryBot.attributes_for(:profile, username: "New Name")
                sign_in @user
                patch :update, params: { id: @other_profile.id, profile: profile_params }
                expect(@other_profile.reload.username).to eq "Old Name"
            end
            
            it "redirect to root path" do
                profile_params = FactoryBot.attributes_for(:profile)
                sign_in @user
                patch :update, params: { id: @other_profile.id, profile: profile_params }
                expect(response).to redirect_to root_path
            end
            
        end
        
        context "as a guest" do
            it "responds 302" do
                profile_params = FactoryBot.attributes_for(:profile, username: "TestUser2")
                patch :update, params: { id: @profile, profile: profile_params }
                expect(response).to have_http_status "302"
            end
            
            it "redirects to loginpage" do
                profile_params = FactoryBot.attributes_for(:profile, username: "TestUser2")
                patch :update, params: { id: @profile, profile: profile_params }
                expect(response).to redirect_to pages_loginpage_path
            end
        end
        
        
    end
end
