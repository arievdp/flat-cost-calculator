class Flat < ApplicationRecord
  # attr_accessor :invitation_token
  has_many :groups
  has_many :users, through: :groups
  has_many :transactions
  has_many :invitations
  accepts_nested_attributes_for :users
  before_create :set_balance

  def set_balance
    self.balance ||= 0.0
  end
end
