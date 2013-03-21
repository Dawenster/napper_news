get '/comment/all' do
  @comments = Comment.all
  erb :comment_list
end

post '/comment/new/:this_post_id' do
  params[:user_id] = get_current_user.id
  params[:post_id] = params[:this_post_id]
  @comment = Comment.new( :content => params[:content],
                          :user_id => params[:user_id],
                          :post_id => params[:post_id])
  if @comment.save
    redirect "/post/#{params[:post_id]}"
  else
    @post = Post.find(params[:post_id])
    erb :post
  end
end

get '/comment/:id' do
  @comment = Comment.find(params[:id])
  erb :comment
end
