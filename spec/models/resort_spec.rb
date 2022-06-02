require 'rails_helper'

RSpec.describe Resort, type: :model do
  let(:resort) { create(:resort) }

  describe 'Attributes' do
    it 'is not valid without a name' do
      resort.name = nil
      expect(resort).to be_invalid
    end
    it 'is not valid without a city' do
      resort.city = nil
      expect(resort).to be_invalid
    end
    it 'is not valid without a country' do
      resort.country = nil
      expect(resort).to be_invalid
    end
    it 'is not valid without a image' do
      resort.image = nil
      expect(resort).to be_invalid
    end
    it 'is not valid without a description' do
      resort.description = nil
      expect(resort).to be_invalid
    end
    it 'is not valid without a cost' do
      resort.cost = nil
      expect(resort).to be_invalid
    end
    it 'cost should be greater than 0.0' do
      resort.cost = -1
      expect(resort).to be_invalid
    end
    it 'cost is greater than 0.0' do
      resort.cost = 1
      expect(resort).to be_valid
    end
    it 'name should be a string' do
      expect(resort.name).to be_kind_of(String)
    end
    it 'city should be a string' do
      expect(resort.city).to be_kind_of(String)
    end
    it 'country should be a string' do
      expect(resort.country).to be_kind_of(String)
    end
    it 'image should be a string' do
      expect(resort.image).to be_kind_of(String)
    end
    it 'description should be a string' do
      expect(resort.description).to be_kind_of(String)
    end
    it 'cost should be a string' do
      expect(resort.cost).to be_kind_of(BigDecimal)
    end
  end

  describe 'Associations' do
    it { should have_many(:reservations) }
  end
end
