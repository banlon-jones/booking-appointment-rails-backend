class User < ApplicationRecord
  has_many :reservations
  has_many :resorts, through: :reservations
  validates :name, presence: true
  validates :role, presence: true
end
