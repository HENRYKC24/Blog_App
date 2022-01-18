class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_likes_counter
    Like.find_by(:id, post_id).count.update
  end
end
