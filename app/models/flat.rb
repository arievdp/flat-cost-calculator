class Flat < ApplicationRecord
  # attr_accessor :invitation_token
  has_many :groups
  has_many :users, through: :groups
  has_many :transactions
  has_many :invitations
  accepts_nested_attributes_for :users

end
