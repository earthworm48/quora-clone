class Question < ActiveRecord::Base
	# self.per_page = 10
	belongs_to :user
	has_many :questionvotes
	has_many :answers
	
	validates :title, presence: true

	# self.per_page = 5

end

# WillPaginate.per_page = 5