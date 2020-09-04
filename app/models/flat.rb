class Flat < ApplicationRecord
  has_many :groups
  has_many :users, through: :groups
  has_many :transactions
  accepts_nested_attributes_for :users
end
