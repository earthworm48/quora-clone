# Create new user
post '/users' do
	# encrypted_password = BCrypt::Password.create(params[:password])
	# byebug
	@user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		erb :"static/index"
	end
end

# user login
post '/users/login' do
	@user = User.find_by(email: params[:email]) 
	# byebug
	if @user.nil?
		@error = "No such email address"
		redirect "/?error_msg=#{@error}"
	elsif @user.authenticate(params[:password])	
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@error = "Wrong combination of e-mail and password"
		redirect "/?error_msg=#{@error}"
	end
end

# user profile page
get '/users/:id' do
	# byebug
@user = User.find(session[:user_id])
	if session[:user_id]
		erb :"users/home"
	else
		 @error = "Please Log In"
	  	redirect "/?error_msg=#{@error}"
	end
end

# Edit user
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :"users/edit"
end

# Update user
patch "/users/:id" do
	user = User.find(params[:id])
	user.update(name: params[:name], email: params[:email], password: params[:password], description: params[:description])
	redirect "/users/#{user.id}"
end

delete "/users/:id" do
	user = User.find(params[:id])
	user.destroy
	redirect "/"	
end

# Log out users
get "/users/:id/logout" do
	session[:user_id] = nil
	redirect "/"
end