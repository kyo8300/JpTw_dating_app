require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of :email }
  
  it { is_expected.to validate_presence_of :password }
  
  it { should validate_length_of(:password).is_at_least(6) }
  
  it "is case insensitive" do
      user = User.create(
          email: "EXamPLe@example.com"
      )
      expect(user.email).to eq "example@example.com"
  end
  
  #mailer, follow, match, auth
end
