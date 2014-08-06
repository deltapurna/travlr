class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true

  # user.authenticate("password")
  # nambahin 2 password & password_confirmation
  # nambahin validasi password & password_confimation
end
