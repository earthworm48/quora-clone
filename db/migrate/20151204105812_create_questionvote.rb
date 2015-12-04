class CreateQuestionvote < ActiveRecord::Migration
	def change
		create_table :questionvotes do |t|
			t.string :user_id
			t.string :question_id

			t.timestamps null:false
		end
	end
end
