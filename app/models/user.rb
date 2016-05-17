class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates :username, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :mobile, presence: true, length: {maximum: 30}
  validates :address, presence:true, length: {maximum: 500}
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
end
