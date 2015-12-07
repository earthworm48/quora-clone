get '/' do
  @top_stories = Question.all
  @top_stories = Question.paginate(page: params[:page], per_page: 5)	
  erb :"questions/all"
end

