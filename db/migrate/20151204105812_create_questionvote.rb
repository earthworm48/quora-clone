class CreateQuestionvote < ActiveRecord::Migration
	def change
		create_table :questionvotes do |t|
			t.integer :user_id
			t.integer :question_id
			
			t.boolean :type
			t.timestamps null:false
		end
	end
end

