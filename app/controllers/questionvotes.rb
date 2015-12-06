# Create new upvotes
post '/questions/:question_id/upvote' do
	question = Question.find(params[:question_id])			
	@question_id = questionvote.question_id

	questionvote = question.questionvotes.create(user_id: current_user.id)

	if questionvotes.find_by(user_id: current_user.id).nil?
		question.questionvotes.find_by(user_id: current_user.id).update(pattern: nil)		
	else
		questionvote = question.questionvotes.create(user_id: current_user.id, pattern: true)
	end
	
	@questionvotes_count =  Questionvote.where(question_id: @question_id).count
	{questionvotes: @questionvotes_count, question_id: @question_id}.to_json	
end	





# Update for upvote
patch "/questionvotes/:questionvotes_id/upvote" do

	questionvote = Questionvote.find(params[:questionvotes_id])
	
	if questionvote.pattern == true
		questionvote.update(pattern: nil)
	else
		questionvote.update(pattern: true)
	end

	if params[:location] == "top_stories"


		redirect "/questions"
	else
		redirect "/questions/#{questionvote.question_id}"
	end
end

# Create new downvotes
post '/questionvotes/downvote' do

	questionvote = Questionvote.create(user_id: current_user.id, question_id: params[:question_id], pattern: false)	
	
	redirect "/questions/#{questionvote.question_id}"
end

# Update for downvote
patch "/questionvotes/:questionvotes_id/downvote" do

	questionvote = Questionvote.find(params[:questionvotes_id])
	
	if questionvote.pattern == false
		questionvote.update(pattern: nil)
	else
		questionvote.update(pattern: false)
	end

	if params[:location] == "top_stories"
		redirect "/questions"
	else
		redirect "/questions/#{questionvote.question_id}"
	end

end



# Delete votes & Downvote!
delete "/questionvotes/:questionvotes_id" do
	questionvote = Questionvote.find(params[:questionvotes_id])
	questionvote.destroy
	redirect "/questions/#{questionvote.question_id}" 	
end

post '/questionvotes' do
	@question = Question.create(title: params[:title],user_id: session[:user_id])	
	redirect "/questionvotes/#{@question.id}"
end

# question profile page
get '/questionvotes/:questionvotes_id' do
	@user = User.find(session[:user_id])
	@question = Question.find(params[:questionvotes_id])
	erb :"questionvotes/home"
end

get '/questionvotes' do
	erb :"questionvotes/all"
end


# Edit question
get '/questionvotes/:questionvotes_id/edit' do
	@question = Question.find(params[:questionvotes_id])
	erb :"questionvotes/edit"
end

# Update question
patch "/questions/:questionvotes_id" do
	question = Question.find(params[:questionvotes_id])
	question.update(title: params[:title])
	redirect "/questions/#{question.id}"
end

