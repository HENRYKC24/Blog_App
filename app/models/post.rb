class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def update_posts_counter
    Post.find_by(:id, post_id).count.update
  end

  def last_5_comments
    Comment.last(5)
  end
end
