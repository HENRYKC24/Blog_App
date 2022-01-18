class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_comments_counter
    Comment.find_by(:id, post_id).count.update
  end
end
