require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { create(:user) }
  let(:resort) { create(:resort) }
  let(:reservation) { create(:reservation, user_id: user.id, resort_id: resort.id) }

  describe 'Attributes validation tests' do
    it 'date_from should be present' do
      reservation.date_from = ''
      expect(reservation).to be_invalid
    end

    it 'date_to should be present' do
      reservation.date_to = ''
      expect(reservation).to be_invalid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:resort) }
  end
end
