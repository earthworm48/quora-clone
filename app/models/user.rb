class User < ActiveRecord::Base
	# include BCrypt
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :name, uniqueness: true
	validates :password, length: {minimum: 8}
	validates_confirmation_of :password 
	# :message => "should match confirmation"

	has_many :questions
	has_secure_password validations: false

end