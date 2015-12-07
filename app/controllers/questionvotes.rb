# Create new upvotes
post '/questions/:question_id/upvote' do
# byebug	
	@question_id = params[:question_id]
	question = Question.find(@question_id)	
	questionvote = question.questionvotes.new(user_id: current_user.id, pattern: true)	

	if !questionvote.save
		questionvote = question.questionvotes.find_by(user_id: current_user)
		if questionvote[:pattern] == true
			questionvote.destroy
			name_upvote = ""
		else
			questionvote.update(pattern: true)
			name_upvote = "d"
		end
	else
		name_upvote = "d"
	end

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
		if questionvote[:pattern] == false
			questionvote.destroy
			name_downvote = ""
		else
			# byebug
			questionvote.update(pattern: false)
			name_downvote = "d"
		end 
	else
		name_downvote = "d"
	end

	name_upvote = ""
	# byebug
	@questionvotes_count =  Questionvote.where(question_id: @question_id).where(pattern: true).count
	{questionvotes: @questionvotes_count, question_id: @question_id, name_upvote: name_upvote, name_downvote: name_downvote}.to_json
end

# ------------------------------------------------------------------

# Update for upvote
patch "/questionvotes/:questionvotes_id/upvote" do

	questionvote = Questionvote.find(params[:questionvotes_id])
	
	if questionvote.pattern == true
		questionvote.update(pattern: nil)
	else
		questionvote.update(pattern: true)
	end
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

