require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user1) {FactoryBot.create(:user)}
  let(:user2) {FactoryBot.create(:user)}
  
  
  describe "validation tests of user model" do
    it { is_expected.to validate_presence_of :email }
    
    it { is_expected.to validate_presence_of :password }
    
    it { should validate_length_of(:password).is_at_least(6) }
    
    it "is case insensitive" do
        user = User.new(
            email: "EXamPLe@example.com"
        )
        user.skip_confirmation!
        user.save
        expect(user.email).to eq "example@example.com"
    end
  end
  
  #mailer, follow, match, auth
  describe "following methods" do
    it "can follow a user" do
      expect(user1.following?(user2)).to be_falsy
      user1.follow(user2)
      expect(user1.following?(user2)).to be_truthy
    end
    
    it "can unfollow a user" do
      user1.follow(user2)
      expect(user1.following?(user2)).to be_truthy
      user1.unfollow(user2)
      expect(user1.following?(user2)).to be_falsy
    end
    
  end
  
  describe "matching" do
    it "can be matching" do
      user1.follow(user2)
      user2.follow(user1)
      expect(user1.matchers).to include(user2)
    end
  end
  
end
