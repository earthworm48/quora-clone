class Question < ActiveRecord::Base
	belongs_to :user
	has_many :questionvotes

	validates :title, presence: true
end