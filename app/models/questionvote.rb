class Questionvote < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	validates :user_id, uniqueness: true
end