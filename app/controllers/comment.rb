get '/comment/all' do
  @comments = Comment.all
  erb :comment_list
end

get '/comment/:id' do
  @comment = Comment.find(params[:id])
  erb :comment
end
