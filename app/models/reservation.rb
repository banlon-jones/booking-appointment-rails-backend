class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :resort
  validates :date_from, presence: true
  validates :date_to, presence: true
end
