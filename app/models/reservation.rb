class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :resort
  validates :date_from, presence: true
  validates :date_to, presence: true

  def as_json(_options = {})
    {
      id: id,
      date_from: date_from,
      date_to: date_to,
      resort: resort
    }
  end
end
