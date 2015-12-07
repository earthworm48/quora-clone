class Answervote < ActiveRecord::Base
	belongs_to :answer
	belongs_to :user

	 validates :user_id, :uniqueness => { :scope => :answer_id,
    :message => "Users may only vote for one time." }
end

