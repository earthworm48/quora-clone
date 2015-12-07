class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	has_many :answervotes
	
	validates :content, presence: true
end