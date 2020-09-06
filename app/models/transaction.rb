class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  before_create :set_date

  def set_date
    self.date = Time.now
  end
end
