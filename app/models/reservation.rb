class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :resort
  validates :date_from, presence: true
  validates :date_to, presence: true

  def as_json(options = {})
    {
      :id => self.id,
      :date_from => self.date_from,
      :date_to => self.date_to,
      :resort => self.resort
    }
  end
end
