class CreateQuestion < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :title
			t.integer :questionvote_id

			t.timestamps null:false
		end
	end
end
