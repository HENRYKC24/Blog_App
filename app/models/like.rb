class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_likes_counter
    Like.find_by(:id, post_id).count.update
  end
end