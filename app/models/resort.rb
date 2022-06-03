class Resort < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :cost, presence: true, comparison: { greater_than: 0.0 }, numericality: true

  def as_json(options = {})
    {
      :id => self.id,
      :name => self.name,
      :city => self.city,
      :country => self.country,
      :image => self.image,
      :description => self.description,
      :cost => self.cost
    }
  end
end
