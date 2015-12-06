class Questionvote < ActiveRecord::Base
	belongs_to :question
	belongs_to :user

	validates :user_id, :uniqueness => { :scope => :question_id,
    :message => "Users may only vote for one time." }
end