class UserImporter
  def self.import
    User.create()
    # ActiveRecord::Base.connection.reset_pk_sequence!('urls')
  end
end

UserImporter.import