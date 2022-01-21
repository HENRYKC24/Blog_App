class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end

  # after_save :update_posts_counter

  private

  def update_posts_counter
    user.increment!(:posts_counter)
  end
end
