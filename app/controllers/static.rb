get '/' do
  @user = User.new
  erb :"static/index"
end