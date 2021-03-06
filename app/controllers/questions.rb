
# Create new question page
get '/questions/new' do
	erb :"questions/form"
end

post '/questions' do
	@question = Question.create(title: params[:title],user_id: session[:user_id])	
	redirect "/questions/#{@question.id}"
end

# question profile page
get '/questions/:question_id' do
	@user = User.find(session[:user_id])
	@question = Question.find(params[:question_id])
	
	erb :"questions/home"
end

# def index
#   @question = Question.search(params[:search], params[:page])
# end

get '/questions' do
	@top_stories = Question.all

	@top_stories = Question.paginate(page: params[:page], per_page: 5)
	erb :"questions/all"
end



# Edit question
get '/questions/:question_id/edit' do
	@question = Question.find(params[:question_id])
	erb :"questions/edit"
end

# Update question
patch "/questions/:question_id" do
	question = Question.find(params[:question_id])
	question.update(title: params[:title])
	redirect "/questions/#{question.id}"
end

delete "/questions/:question_id" do
	question = Question.find(params[:question_id])
	# byebug
	question.destroy
	redirect "/users/#{session[:user_id]}" 	
end