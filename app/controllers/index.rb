require 'paginate'

get '/' do
  @posts = Post.all.reverse
  erb :index
end


