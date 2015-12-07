class Question < ActiveRecord::Base
	belongs_to :user
	has_many :questionvotes
	has_many :answers
	
	validates :title, presence: true
end