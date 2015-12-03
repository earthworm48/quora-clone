
# Create new question page
get '/answers/new' do
	erb :"answers/form"
end

post '/answers' do
	@question = Question.create(title: params[:title],user_id: session[:user_id])	
	redirect "/answers/#{@question.id}"
end

# question profile page
get '/answers/:answer_id' do
	@user = User.find(session[:user_id])
	@question = Question.find(params[:answer_id])
	erb :"answers/home"
end

get '/answers' do
	erb :"answers/all"
end


# Edit question
get '/answers/:answer_id/edit' do
	@question = Question.find(params[:answer_id])
	erb :"answers/edit"
end

# Update question
patch "/answers/:answer_id" do
	question = Question.find(params[:answer_id])
	question.update(title: params[:title])
	redirect "/answers/#{question.id}"
end

delete "/answers/:answer_id" do
	question = Question.find(params[:answer_id])
	# byebug
	question.destroy
	redirect "/users/#{session[:user_id]}" 	
end