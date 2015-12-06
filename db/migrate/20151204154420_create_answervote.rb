class CreateAnswervote < ActiveRecord::Migration
	def change
		create_table :questionvotes do |t|
			t.string :user_id
			t.string :answer_id
			t.boolean :pattern
			
			t.timestamps null:false
		end
	end
end
