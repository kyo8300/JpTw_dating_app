require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:user1) {FactoryBot.create(:user)}
  
  it { is_expected.to validate_presence_of :username }
  
  it { is_expected.to validate_length_of(:singleword).is_at_most(100) }
  
  it { is_expected.to validate_numericality_of(:height).
    is_less_than_or_equal_to(200).
    is_greater_than_or_equal_to(130)
  }
  
  it "calculates a age of the user from birth" do
    profile = Profile.create(
      birth: "1997-8-30",
      user: user1
    )
    expect(profile.calage).to eq 21
  end
  
  describe "Search function" do
    let(:user2) {FactoryBot.create(:user)}
    
    let!(:profile1) {Profile.create(
      username: "kyo",
      sex: 1,
      birth: "1997-8-30",
      age: 21,
      #nationality: 0 = Japan
      nationality: 0,
      height: 170,
      occupation: 0,
      user: user1,
    )}
    
    let!(:profile2) {Profile.create(
      username: "yang ju",
      sex: 0,
      birth: "1996-10-30",
      age: 22,
      #nationality: 1 = Taiwan
      nationality: 1,
      height: 160,
      occupation: 0,
      user: user2,
    )}
    
    it "gets by username" do
      expect(Profile.get_by_username("kyo")).to include(profile1)
      expect(Profile.get_by_username("kyo")).to_not include(profile2)
    end
    
    it "gets by occupation" do
      #occupation:0 = student
      expect(Profile.get_by_occpation(0)).to include(profile1,profile2)
    end
    
    it "gets by height1" do
      expect(Profile.get_by_height1(150)).to include(profile1,profile2)
    end
    
    it "gets by height2" do
      expect(Profile.get_by_height2(160)).to include(profile2)
      expect(Profile.get_by_height2(160)).to_not include(profile1)
    end
    
    it "gets by age1" do
      expect(Profile.get_by_age1(22)).to include(profile2)
      expect(Profile.get_by_age1(22)).to_not include(profile1)
    end
    
    it "gets by age1" do
      expect(Profile.get_by_age2(21)).to include(profile1)
      expect(Profile.get_by_age2(21)).to_not include(profile2)
    end
    
  end
  
  describe "avatar of user" do
    let(:image_path) { File.join(Rails.root, 'spec/files/sample_avatar.png') }
    let(:image) { Rack::Test::UploadedFile.new(image_path) }
    let!(:profile1) {Profile.create(
      username: "kyo",
      sex: 1,
      birth: "1997-8-30",
      age: 21,
      #nationality: 0 = Japan
      nationality: 0,
      height: 170,
      occupation: 0,
      image: image,
      user: user1,
    )}
    
    it "has avatar" do
      expect(user1.profile).to be_valid
    end
  end
end