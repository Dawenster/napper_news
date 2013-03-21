post '/vote/post/:this_post_id/new' do
  PostVote.create(:user_id => get_current_user.id,
                  :post_id => params[:this_post_id])
  redirect "/post/#{params[:this_post_id]}"
end

post '/vote/comment/:this_comment_id/new' do
  vote = CommentVote.create( :user_id => get_current_user.id,
                             :comment_id => params[:this_comment_id])
  redirect "/post/#{vote.comment.post.id}"
end

