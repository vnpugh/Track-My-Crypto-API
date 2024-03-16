class User < ApplicationRecord
  # email uniqueness
  before_save { self.email = email.downcase }

  has_many :watchlists, dependent: :destroy

  # Validations
  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :username, presence: true, uniqueness: true, length: { minimum: 6 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validate :validate_watchlists_count       

  # bcrypt to hash passwords
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  # Method returns a greeting with the user's first name
  def greeting
    "Hello, #{firstname}!"
  end

  private

  def validate_watchlists_count
    errors.add(:watchlists, "exceeds maximum number of 10") if watchlists.count > 10
  end
end
