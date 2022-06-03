class Resort < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations
  validates :name, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :image, presence: true
  validates :description, presence: true
  validates :cost, presence: true, comparison: { greater_than: 0.0 }, numericality: true

  def as_json(_options = {})
    {
      id: id,
      name: name,
      city: city,
      country: country,
      image: image,
      description: description,
      cost: cost
    }
  end
end
