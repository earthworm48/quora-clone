# Create new upvotes
post '/answers/:answer_id/upvote' do
# byebug	
	@answer_id = params[:answer_id]
	answer = Answer.find(@answer_id)	
	answervote = answer.answervotes.new(user_id: current_user.id, pattern: true)	

	if !answervote.save
		answervote = answer.answervotes.find_by(user_id: current_user)
		if answervote[:pattern] == true
			answervote.destroy
			name_upvote = ""
		else
			answervote.update(pattern: true)
			name_upvote = "d"
		end
	else
		name_upvote = "d"
	end

	name_downvote = ""

	@answervotes_count =  Answervote.where(answer_id: @answer_id).where(pattern: true).count
	{answervotes: @answervotes_count, answer_id: @answer_id, name_upvote: name_upvote, name_downvote: name_downvote}.to_json
end

# Create new downvotes
post '/answers/:answer_id/downvote' do	
	@answer_id = params[:answer_id]
	answer = Answer.find(@answer_id)	
	answervote = answer.answervotes.new(user_id: current_user.id, pattern: false)	

	if !answervote.save 
		answervote = answer.answervotes.find_by(user_id: current_user)
		if answervote[:pattern] == false
			answervote.destroy
			name_downvote = ""
		else
			# byebug
			answervote.update(pattern: false)
			name_downvote = "d"
		end 
	else
		name_downvote = "d"
	end

	name_upvote = ""
	# byebug
	@answervotes_count =  Answervote.where(answer_id: @answer_id).where(pattern: true).count
	{answervotes: @answervotes_count, answer_id: @answer_id, name_upvote: name_upvote, name_downvote: name_downvote}.to_json
end