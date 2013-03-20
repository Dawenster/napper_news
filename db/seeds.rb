User.create(:email => "james@gmail.com", :password_hash => "james")
User.create(:email => "david@gmail.com", :password_hash => "david")

10.times do
  title = Faker::Lorem.sentence
  text = Faker::Lorem.paragraph
  Post.create(:title => title, :text => text, :user_id => rand(2) + 1)

  title = Faker::Lorem.sentence
  url = Faker::Internet.url
  Post.create(:title => title, :url => url, :user_id => rand(2) + 1)
end

120.times do
  content = Faker::Lorem.sentence(word_count = rand(30))
  Comment.create(:content => content, :user_id => rand(2) + 1, :post_id => rand(20) + 1)
end


600.times do
  PostVote.create(:user_id=>rand(3) + 1, :post_id => rand(10) + 1)
end

600.times do
  CommentVote.create(:user_id=>rand(3) + 1, :comment_id => rand(12) + 1)
end
