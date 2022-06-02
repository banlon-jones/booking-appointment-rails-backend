require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'validate data' do
    it 'name should be present' do
      user.name = ''
      expect(user).to_not be_valid
    end

    it 'name should be present' do
      user.name = 'John'
      expect(user).to be_valid
    end
    it 'role should be present' do
      user.role = ''
      expect(user).to_not be_valid
    end

    it 'role should be present' do
      user.role = 'John'
      expect(user).to be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:reservations) }
  end
end
