class User < ActiveRecord::Base
	validates :email, uniqueness: true
	has_many :questions
end