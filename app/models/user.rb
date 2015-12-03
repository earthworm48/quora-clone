class User < ActiveRecord::Base
	# include BCrypt
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :name, uniqueness: true
	validates :password, confirmation: true, length: {minimum: 8}
	validates :password_confirmation, presence: true
	
	has_many :questions
	has_secure_password validations: false

end