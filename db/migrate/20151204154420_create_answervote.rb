class CreateAnswervote < ActiveRecord::Migration
	def change
		create_table :answervotes do |t|
			
			t.integer :user_id
			t.integer :answer_id
			t.boolean :pattern
			
			t.timestamps null:false
		end
	end
end

