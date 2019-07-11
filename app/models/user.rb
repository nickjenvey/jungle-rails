class User < ActiveRecord::Base

  has_secure_password

  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 3 }
  validates :password_confirmation, presence: true
  validates :first_name, :last_name, presence: true

end
