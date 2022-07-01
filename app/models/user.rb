class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false },
            format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
            message: 'The format of Email is invalid'}
  validates :password, presence: true, :length => {:minimum => 8 }
  validates :password_confirmation, presence: true

end
