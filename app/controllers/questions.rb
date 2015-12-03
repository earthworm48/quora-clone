
# Create new question page
get '/questions/new' do
	erb :"questions/form"
end

post '/questions' do
	@question = Question.create(title: params[:title])	
	redirect "/question/#{@question.id}"
end

# question profile page
get '/question/:question_id' do
	@user = User.find(session[:user_id])
	@question = Question.find(params[:question_id])
	erb :"questions/home"
end

# Edit question
get '/question/:question_id/edit' do
	@question = Question.find(params[:question_id])
	erb :"questions/edit"
end

# Update user
patch "/question/:question_id" do
	question = Question.find(params[:question_id])
	question.update(title: params[:title])
	redirect "/question/#{question.id}"
end

delete "/question/:id" do
	question = Question.find(params[:id])
	question.destroy
	redirect 	
end