class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :resort
  validates :date_from, presence: true
  validates :date_to, presence: true

  def as_json(_options = {})
    {
      id:,
      date_from:,
      date_to:,
      resort:
    }
  end
end
