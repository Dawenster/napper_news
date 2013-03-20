get '/post/new' do
  erb :create_post
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
  erb :post
end



