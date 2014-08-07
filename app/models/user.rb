class User < ActiveRecord::Base
  # Callback
  before_create :set_auth_token

  has_secure_password

  validates :email, presence: true, uniqueness: true

  def set_auth_token
    self.auth_token = loop do
      token = SecureRandom.hex
      break token unless self.class.exists?(auth_token: token)
    end
  end
end
