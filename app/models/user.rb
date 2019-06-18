class User < ApplicationRecord
  has_many :lists

  validates :name, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  has_secure_password

  def any_errors?
    self.errors.any?
  end

  def error_count
    self.errors.count
  end

  def full_messages
    self.errors.full_messages
  end
end
