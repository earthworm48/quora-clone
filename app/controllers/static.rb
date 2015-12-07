get '/' do
  @user = User.new
  if params[:error_msg]
  	@error = params[:error_msg]
  end
  erb :"questions/all"
end