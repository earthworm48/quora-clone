require 'byebug'
require 'bcrypt'
# Create new user
post '/users' do
	# encrypted_password = BCrypt::Password.create(params[:password])
	# byebug
	@user = User.new(name: params[:name], email: params[:email], password: params[:password])
	if @user.save
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
		# @error = "No such user exist! Please register!"
		erb :"static/error"
	elsif @user.authenticate(params[:password])	
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@error = "Wrong combination of e-mail and password"
		erb :"static/index"
	end
end

# user profile page
get '/users/:id' do
	@user = User.find(params[:id])
	erb :"user/home"
end

# Edit user
get '/users/:id/edit' do
	@user = User.find(params[:id])
	erb :"user/edit"
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