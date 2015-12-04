# Create new upvtes
post '/questionvotes/upvote' do
	questionvote = Questionvote.create(user_id: current_user.id, question_id: params[:question_id],)	
	redirect "/questions/#{questionvote.question_id}"
end


# Update to upvote
patch "/questionvotes/:questionvotes_id" do
	questionvote = Questionvote.find(params[:questionvotes_id])
	questionvote.update(type: true)
	redirect "/questions/#{questionvote.question_id}"
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

