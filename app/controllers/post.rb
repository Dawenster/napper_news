get '/post/new' do
  if get_current_user
    erb :create_post
  else
    redirect '/user/login'
  end
end

post '/post/new' do
  params[:user_id] = get_current_user.id
  @post = Post.new(params)
  if @post.save
    redirect "/post/#{@post.id}"
  else
    erb :login
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @user = get_current_user
  erb :post
end



