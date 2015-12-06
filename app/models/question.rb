class Question < ActiveRecord::Base
	belongs_to :user
	has_many :questionvotes

	validates :title, presence: true
	acts_as_votable
end