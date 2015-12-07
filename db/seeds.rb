class UserImporter
  def self.import
    
  	20.times do
  		name = Faker::Name.name
  		email = Faker::Internet.email
  		password = "12345678" 
  		title = Faker::Lorem.sentence
  		content = Faker::Lorem.paragraph
  		random = rand(1...20)
    	user = User.create(name: name, email: email, password: password)
    	
    	question = Question.create(title: title, user_id: random)

    	answer = Answer.create(content: content, user_id: random , question_id: random )

    end	

  end
end

UserImporter.import