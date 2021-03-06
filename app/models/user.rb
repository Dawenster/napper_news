require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/ }

  has_many :comments #, :posts, :post_votes, :comment_votes
  has_many :posts
  has_many :post_votes
  has_many :comment_votes

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.login(email, password)
    @user = User.find_by_email(email)
    if @user && @user.password == password
      @user
    else
      false
    end
  end
  

end
