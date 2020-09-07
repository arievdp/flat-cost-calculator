class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  before_create :set_date, :set_balance

  def set_date
    self.date = Time.now
  end

  def set_balance
    self.balance ||= 0.0
    self.balance += self.amount
  end

end
