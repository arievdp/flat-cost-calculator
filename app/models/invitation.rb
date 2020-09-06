class Invitation < ApplicationRecord
  belongs_to :flat, dependent: :destroy
  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([Time.now, rand].join)
  end
end
