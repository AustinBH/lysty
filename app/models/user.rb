class User < ApplicationRecord
  has_many :lists

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password
end
