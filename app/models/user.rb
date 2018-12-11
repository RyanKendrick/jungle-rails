class User < ActiveRecord::Base
  has_many :reviews

  has_secure_password

  validates :password, length: {minimum: 5}, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive:
  false}
  validates :name, presence: true
end
