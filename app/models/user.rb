class User < ActiveRecord::Base
	
	## Callbacks
	before_save {self.email = email.downcase }

	## Validations
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}
  validates :name,  presence: true, length: { maximum: 50 }
  
  has_secure_password

	validates :password, length: {minimum: 6 }
	validates_confirmation_of :password, if: lambda {|m| m.password.present? }
	
	## Relationships
	has_many :microposts

	
	


end
