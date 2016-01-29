require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#validations' do

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }

    it { should validate_presence_of :password }
    it { should validate_confirmation_of :password }
    it { should validate_length_of(:password).is_at_least(3).is_at_most(50) }

    it 'must be valid' do
      u = build(:user)
      expect(u).to be_valid
    end
  end


end
