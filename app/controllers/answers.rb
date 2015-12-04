
# Create new answers
post '/answers' do
	@answer = Answer.create(content: params[:content],user_id: session[:user_id],question_id: params[:question_id])	
	redirect "/questions/#{@answer.question_id}"
end

# Display all answers
get '/answers' do
	erb :"answers/all"
end

# Edit question
get '/answers/:answer_id/edit' do
	@answer = Answer.find(params[:answer_id])
	erb :"answers/edit"
end

# Update question
patch "/answers/:answer_id" do
	answer = Answer.find(params[:answer_id])
	answer.update(content: params[:content])
	redirect "/questions/#{answer.question_id}"
end

delete "/answers/:answer_id" do
	answer = Answer.find(params[:answer_id])
	# byebug
	answer.destroy
	redirect "/questions/#{answer.question_id}" 	
end