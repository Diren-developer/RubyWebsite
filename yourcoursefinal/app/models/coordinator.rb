class Coordinator < ApplicationRecord
  has_many :courses
  has_many :votes
  
  PASSWORD_FORMAT = /\A
		(?=.*\d)           # Must contain a digit
		(?=.*[a-z])        # Must contain a lower case character
		(?=.*[A-Z])        # Must contain an upper case character
		(?=.*[[:^alnum:]]) # Must contain a symbol
	/x
  
  validates :name, presence: true, length: { minimum: 4 }
  validates :email, presence: true, length: { minimum: 4 }, format: { with: /\b[A-Z0-9._%a-z\-]+@rmit\.edu\.au\z/, message: "Registration only open for RMIT staff" }
  validate :password_validation
  
  def password_validation
    if !self.password.present?
	  errors.add(:password, "can't be blank")
	end
	if !self.password.present? || self.password.length < 8 || !self.password.match(PASSWORD_FORMAT)
      errors.add(:password, "must contains at least a lowercase letter, an uppercase, a digit, a special character and 8+ characters")
    end
  end
end
