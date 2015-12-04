class ChangeQuestionvotesColumnName < ActiveRecord::Migration
	def change
		rename_column :questionvotes, :type, :pattern
	end
end
