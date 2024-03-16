class User < ApplicationRecord
    # email uniqueness
    before_save { self.email = email.downcase }
  
    # Validations
    validates :firstname, presence: true, length: { maximum: 50 }
    validates :lastname, presence: true, length: { maximum: 50 }
    validates :username, presence: true, uniqueness: true, length: { minimum: 6 }

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
  
    # bcrypt to hash passwords
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
  
    # Method returns a greeting with the user's first name
    def greeting
      "Hello, #{firstname}!"
    end
  end
  
