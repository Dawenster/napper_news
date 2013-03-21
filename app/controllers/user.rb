get '/user/login' do
  erb :login
end

post '/user/signup' do
  @user = User.new(params[:signup])
  if @user.save
    session[:id] = @user.id
    redirect '/'
  else
    erb :login
  end
end

post '/user/login' do
  @user = User.login(params[:login][:email], params[:login][:password])
  if @user
    session[:id] = @user.id
    redirect '/'
  else
    @errors = "WTF. Try again."
    erb :login
  end
end

get '/user/logout' do
  session.clear
  redirect '/'
end

get '/user/profile' do
  @user = get_current_user
  erb :profile
end
