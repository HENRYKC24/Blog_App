class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_many :likes

  def get_last_three_posts
    Post.last(3)
  end
end
