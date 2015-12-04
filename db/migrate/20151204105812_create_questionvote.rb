class CreateQuestionvote < ActiveRecord::Migration
	def change
		create_table :questionvotes do |t|
			t.string :user_id
			t.string :question_id
			t.boolean :type
			t.timestamps null:false
		end
	end
end

