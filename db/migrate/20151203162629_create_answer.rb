class CreateAnswer < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :content
			t.string :user_id
			t.string :question_id

			t.timestamps null:false
		end
	end
end
