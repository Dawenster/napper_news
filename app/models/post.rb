class Post < ActiveRecord::Base
  # Remember to create a migration!
  validates :title, :presence => true
  belongs_to :user
  has_many :comments
  has_many :post_votes

end
