class Resort < ApplicationRecord
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :cost, presence: true, comparison: { greater_than: 0.0 }, numericality: true
end
