class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments

  def last_5_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
