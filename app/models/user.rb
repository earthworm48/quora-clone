require 'bcrypt'
require 'byebug'
class User < ActiveRecord::Base
	include BCrypt
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :name, uniqueness: true
	validates :password, length: {minimum: 8}
	has_many :questions
	has_secure_password validations: false
	# def encrypted_password

	# 	encrypted_password = BCrypt::Password.create(password)
	# end
end