require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:user1) {FactoryBot.create(:user)}
  let(:user2) {FactoryBot.create(:user)}
  
  describe "validation tests" do
      let(:relationship) {Relationship.new(
        follower_id: user1.id,
        following_id: user2.id,
      )}
      
      it "should be valid" do
          expect(relationship).to be_valid
      end
      
      it { is_expected.to validate_presence_of :follower_id }
      
      it { is_expected.to validate_presence_of :following_id }
      
  end
end
