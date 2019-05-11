require 'rails_helper'

RSpec.describe Message, type: :model do
  
  it { is_expected.to validate_presence_of :from_id }
      
  it { is_expected.to validate_presence_of :to_id }
  
  it { is_expected.to validate_presence_of :room_id }
  
  it { is_expected.to validate_presence_of :content }
  
  it { is_expected.to validate_length_of(:content).is_at_most(50) }
  
end
