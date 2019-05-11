require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
    before do
        @user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user)
        @profile1 = FactoryBot.create(:profile, user: @user1)
        @profile2 = FactoryBot.create(:profile,:female ,user: @user2)
    end
    
    describe "#create" do
        describe "an unauthorized user" do
            it "should require logged-in user when create" do
                expect{
                    post :create, format: :json, params: { following_id: @user2.id }
                }.to_not change(Relationship, :count)
            end
            
            it "redirects to loginpage" do
                post :create, format: :json,params: { following_id: @user2.id }
                expect(response).to redirect_to pages_loginpage_path
            end
        end
        
        describe "logged in user" do
            it "creates relationship when a user is logged in" do
                sign_in @user1
                expect{
                    post :create, format: :json ,params: { following_id: @user2.id }
                }.to change(Relationship, :count).by(1)
            end
        end
    end
    
    describe "#destroy" do
        before do
            @relationship = FactoryBot.create(:relationship, follower: @user1, following: @user2)
        end
        
        context "as a logged-in user" do
            it "does delete the relationship" do
                sign_in @user1
                expect {
                    delete :destroy, params: {id: @relationship.id}
                }.to change(Relationship, :count).by(-1)
            end
        end
        
        context "as a guest" do
            it "returns 302" do
                delete :destroy, params: {id: @relationship.id}
                expect(response).to have_http_status "302"
            end
            
            it "redirects to matching path" do
                sign_in @user1
                delete :destroy, params: {id: @relationship.id}
                expect(response).to redirect_to matching_index_path
            end
            
            it "does not delete the project" do
                expect {
                    delete :destroy, params: {id: @relationship.id}
                }.to_not change(Relationship, :count)
            end
        end
    end
end
