# Create new upvotes
post '/questions/:question_id/upvote' do
# byebug	
	@question_id = params[:question_id]
	question = Question.find(@question_id)	
	questionvote = question.questionvotes.new(user_id: current_user.id, pattern: true)	

	if !questionvote.save
		questionvote = question.questionvotes.find_by(user_id: current_user)
		if questionvote[:pattern] != true
			questionvote.update(pattern: true)
		else
			questionvote.update(pattern: nil)
		end
	end

	if questionvote[:pattern] != true
		name_upvote = ""
	else
		name_upvote = "d"
	end
	# byebug
	name_downvote = ""

	@questionvotes_count =  Questionvote.where(question_id: @question_id).where(pattern: true).count
	{questionvotes: @questionvotes_count, question_id: @question_id, name_upvote: name_upvote, name_downvote: name_downvote}.to_json
end

# Create new downvotes
post '/questions/:question_id/downvote' do	
	@question_id = params[:question_id]
	question = Question.find(@question_id)	
	questionvote = question.questionvotes.new(user_id: current_user.id, pattern: false)	

	if !questionvote.save
		questionvote = question.questionvotes.find_by(user_id: current_user)
		if questionvote[:pattern] != false
			questionvote.update(pattern: false)

		else
			questionvote.update(pattern: nil)
		end
	end

	if questionvote[:pattern] != false
		name_downvote = ""
	else
		name_downvote = "d"
	end

	name_upvote = ""

	@questionvotes_count =  Questionvote.where(question_id: @question_id).where(pattern: true).count
	{questionvotes: @questionvotes_count, question_id: @question_id, name_upvote: name_upvote, name_downvote: name_downvote}.to_json
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

